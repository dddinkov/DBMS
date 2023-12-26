#pragma once

#include "table.h"
#include <iomanip>
#include <exception>
#include <cstddef>
#include <iostream>
#include <fstream>

void Table::check_key(const std::string& val)
{
	if (primary_key.type ==Type::Null)
	{
		return;
	}
	for (DataRow row : rows)
	{
		if (row[primary_key] == val)
		{
			throw std::exception("ERROR: A duplicate key occured.");
		}
	}
}

DataColumn Table::getCol(const std::string& col) const
{
	for (const DataColumn& dataCol : columns)
	{
		if (dataCol.name == col)
		{
			return dataCol;
		}
	}
	return { "", Type::Null };
}

Table::Table()
{
	this->primary_key = {"key", Type::Null };
}

Table::Table(const std::string& name)
{
	this->name = name;
	this->primary_key = {"key", Type::Null};
}

std::size_t Table::size() const
{
	return rows.size();
}

void Table::addColumn(const DataColumn& col)
{
	columns.push_back(col);
}

void Table::addRow(const DataRow& row)
{
	if (primary_key.type != Type::Null)
	{
		check_key(row[primary_key]);
	}
	rows.push_back(row);
}

void Table::setPK(const DataColumn& col)
{
	primary_key = col;
}

void Table::insert(const std::vector<std::string>& values)
{
	if (values.size() != columns.size())
	{
		std::string message = "Amount of arguments to be inserted doesn't match size of columns:\nGiven: " + values.size();
		message += "\nNeeded: " + columns.size();
		throw std::invalid_argument(message);
	}

	DataRow row;
	for (std::size_t i = 0; i < columns.size(); ++i)
	{
		row.add(columns[i], values[i]);
	}
	rows.push_back(row);
}

void Table::update(const std::vector<std::string>& cols, const std::vector<std::string>& values, const std::string& key, const std::string& keyValue, const std::string& op)
{
	std::vector<DataColumn> dataCols;
	DataColumn colKey;
	for (std::size_t i = 0; i < cols.size(); ++i)
	{
		DataColumn dataCol = getCol(cols[i]);
		if (dataCol.type == Type::Null)
		{
			std::string message = "Unrecognised column: " + cols[i];
			throw std::invalid_argument(message);
		}
		dataCols.push_back(dataCol);
	}

	if (dataCols.size() < values.size())
	{
		throw std::exception("Unrecognised identifiers.");
	}

	for (DataRow& row : this->rows)
	{
		if (op == "=")
		{
			if (row[colKey] == keyValue)
			{
				for (std::size_t i = 0; i < values.size(); ++i)
				{
					row.update(dataCols[i], values[i]);
				}
			}
		}
		else if (op == "!=")
		{
			if (row[colKey] == keyValue)
			{
				for (std::size_t i = 0; i < values.size(); ++i)
				{
					row.update(dataCols[i], values[i]);
				}
			}
		}
		else if (op == "<=")
		{
			DataRow temp;
			temp.add(colKey, keyValue);
			if (row.compare(colKey, temp) <= 0)
			{
				for (std::size_t i = 0; i < values.size(); ++i)
				{
					row.update(dataCols[i], values[i]);
				}
			}
		}
		else if (op == "<")
		{
			DataRow temp;
			temp.add(colKey, keyValue);
			if (row.compare(colKey, temp) == -1)
			{
				for (std::size_t i = 0; i < values.size(); ++i)
				{
					row.update(dataCols[i], values[i]);
				}
			}
		}
		else if (op == ">=")
		{
			DataRow temp;
			temp.add(colKey, keyValue);
			if (row.compare(colKey, temp) >= 0)
			{
				for (std::size_t i = 0; i < values.size(); ++i)
				{
					row.update(dataCols[i], values[i]);
				}
			}
		}
		else if (op == ">")
		{
			DataRow temp;
			temp.add(colKey, keyValue);
			if (row.compare(colKey, temp) == 1)
			{
				for (std::size_t i = 0; i < values.size(); ++i)
				{
					row.update(dataCols[i], values[i]);
				}
			}
		}
	}
}

Table Table::orderBy(const std::string& col, const bool& asc) const
{
	Table res;
	res.columns = columns;
	res.rows = rows;
	res.primary_key = primary_key;

	DataColumn dataCol;

	for (const DataColumn& column : columns)
	{
		if (column.name == col)
		{
			dataCol = column;
		}
	}

	for (std::size_t i = 0; i < res.rows.size(); ++i)
	{
		std::size_t top = i;
		for (std::size_t j = i + 1; j < rows.size(); ++j)
		{
			std::size_t colIndex = 0;
			if (res.rows[i].compare(dataCol, res.rows[j]) == -1 && !asc)
			{
				top = j;
			}
			else if (res.rows[i].compare(dataCol, res.rows[j]) == 1 && asc)
			{
				top = j;
			}
		}
		if (top != i)
		{
			DataRow temp = res.rows[i];
			res.rows[i] = res.rows[top];
			res.rows[top] = temp;
		}
	}
	return res;
}

Table Table::filterBy(const std::string& col, const std::string& op, const std::string& value)
{
	Table res;
	res.columns = columns;
	res.primary_key = primary_key;

	DataColumn dataCol;

	for (const DataColumn& column : columns)
	{
		if (column.name == col)
		{
			dataCol = column;
		}
	}

	for (DataRow row : rows)
	{
		DataRow temp;
		temp.add(dataCol, value);

		int compareValue = row.compare(dataCol, temp);
		if (op == "=" && compareValue == 0)
		{
			res.rows.push_back(row);
		}
		else if (op == "!=" && compareValue != 0)
		{
			res.rows.push_back(row);
		}
		else if (op == "<=" && compareValue <= 0)
		{
			res.rows.push_back(row);
		}
		else if (op == "<" && compareValue == -1)
		{
			res.rows.push_back(row);
		}
		else if (op == ">=" && compareValue >= 0)
		{
			res.rows.push_back(row);
		}
		else if (op == ">" && compareValue == 1)
		{
			res.rows.push_back(row);
		}
	}
	return res;
}

void Table::print(const std::vector<std::string>& cols) const
{
	for (const DataRow& row : rows)
	{
		for (std::size_t i = 0; i < cols.size(); ++i)
		{
			const std::string& col = cols[i];
			if (col == "*")
			{
				for (std::size_t j = 0; j < columns.size() - 1; ++j)
				{
					std::cout << row[columns[j]] << ", ";
				}
				if (i == cols.size() - 1)
				{
					std::cout << row[columns[columns.size()-1]];
				}
				else
				{
					std::cout << row[columns[columns.size() - 1]] << ", ";
				}
			}
			else
			{
				for (const DataColumn& myCol : columns)
				{
					if (myCol.name == col)
					{
						std::cout << row[myCol];
						if (i != cols.size() - 1)
						{
							std::cout << ", ";
						}
					}
				}
			}
		}
		std::cout << std::endl;
	}
}

void Table::save()
{
	std::string fileName = this->name + ".bin";
	std::fstream os(fileName, std::ios::out | std::ios::binary);

	std::size_t columnsLength = columns.size();
	os.write(reinterpret_cast<const char*>(&columnsLength), sizeof(std::size_t));

	std::size_t rowsLength = rows.size();
	os.write(reinterpret_cast<const char*>(&rowsLength), sizeof(std::size_t));

	for (DataColumn &col:columns)
	{
		col.serialize(os);
	}

	for (DataRow& row : rows)
	{
		row.serialize(os);
	}

	this->primary_key.serialize(os);

	os.close();
}

void Table::read()
{
	std::string fileName = this->name + ".bin";
	std::fstream is(fileName, std::ios::in);

	std::size_t columnsLength, rowsLength;
	is.read(reinterpret_cast<char*>(&columnsLength), sizeof(std::size_t));
	is.read(reinterpret_cast<char*>(&rowsLength), sizeof(std::size_t));

	for (std::size_t i = 0; i < columnsLength; ++i)
	{
		DataColumn col;
		col.deserialize(is);
		columns.push_back(col);
	}


	for (std::size_t i = 0; i < rowsLength; ++i)
	{
		DataRow row;
		row.deserialize(is);
		rows.push_back(row);
	}

	this->primary_key.deserialize(is);

	is.close();
}

std::size_t Table::count(const std::string& col) const
{
	DataColumn dataCol = getCol(col);
	if (dataCol.type == Type::Null && col != "*") // COUNT(*) is valid
	{
		std::string message = "Invalid column in COUNT aggregate function: " + col + ".";
		throw std::invalid_argument(message);
	}

	// I do not allow null values so we just return rows size.
	return rows.size();
}

double Table::min(const std::string& col) const
{
	DataColumn dataCol = getCol(col);
	if (dataCol.type == Type::Null)
	{
		std::string message = "Invalid column in MIN aggregate function: " + col + ".";
		throw std::invalid_argument(message);
	}
	
	if (dataCol.type != Type::Int && dataCol.type != Type::Double)
	{
		std::string message = "Invalid column type in MIN aggregate function: " + col + ".";
		throw std::invalid_argument(message);
	}

	double min = std::stod(rows[0][dataCol]);
	for (std::size_t i = 1; i < rows.size(); ++i)
	{
		double current = std::stod(rows[i][dataCol]);
		if (min > current)
		{
			min = current;
		}
	}
	return min;
}

double Table::max(const std::string& col) const 
{
	DataColumn dataCol = getCol(col);
	if (dataCol.type == Type::Null)
	{
		std::string message = "Invalid column in MAX aggregate function: " + col + ".";
		throw std::invalid_argument(message);
	}
	if (dataCol.type != Type::Int && dataCol.type != Type::Double) 
	{
		std::string message = "Invalid column type in MAX aggregate function: " + col + ".";
		throw std::invalid_argument(message);
	}

	double max = std::stod(rows[0][dataCol]);
	for (std::size_t i = 1; i < rows.size(); ++i)
	{
		double current = std::stod(rows[i][dataCol]);
		if (max < current)
		{
			max = current;
		}
	}
	return max;
}

double Table::avg(const std::string& col) const 
{
	DataColumn dataCol = getCol(col);
	if (dataCol.type == Type::Null)
	{
		std::string message = "Invalid column in AVG aggregate function: " + col + ".";
		throw std::invalid_argument(message);
	}

	if (dataCol.type != Type::Int && dataCol.type != Type::Double) 
	{
		std::string message = "Invalid column type in AVG aggregate function: " + col + ".";
		throw std::invalid_argument(message);
	}

	double sum = std::stod(rows[0][dataCol]);
	for (std::size_t i = 1; i < rows.size(); ++i)
	{
		double current = std::stod(rows[i][dataCol]);
		sum += current;
	}
	return sum / rows.size();
}

double Table::sum(const std::string& col) const
{
	DataColumn dataCol = getCol(col);
	if (dataCol.type == Type::Null)
	{
		std::string message = "Invalid column in SUM aggregate function: " + col + ".";
		throw std::invalid_argument(message);
	}

	if (dataCol.type != Type::Int && dataCol.type != Type::Double) 
	{
		std::string message = "Invalid column type in SUM aggregate function: " + col + ".";
		throw std::invalid_argument(message);
	}

	double sum = std::stod(rows[0][dataCol]);
	for (std::size_t i = 1; i < rows.size(); ++i)
	{
		double current = std::stod(rows[i][dataCol]);
		sum += current;
	}
	return sum;
}


std::ostream& operator<<(std::ostream& os, const Table& table)
{
	for (DataColumn col : table.columns)
	{
		os << std::left << std::setw(20) << col.name;
	}
	os << '\n';
	for (DataRow row : table.rows)
	{
		os << std::left << std::setw(20) << row;
		os << '\n';
	}

	return os;
}
