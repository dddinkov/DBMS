#include "table.h"
#include "btree.h"
#include <iomanip>
#include <exception>
#include <cstddef>
#include <iostream>
#include <fstream>
#include <algorithm>

void Table::check_key(const std::string& val)
{
	if (primary_key.type ==Type::Null)
	{
		return;
	}
	for (DataRow& row : rows)
	{
		if (row[primary_key] == val)
		{
			throw std::runtime_error("ERROR: Duplicate primary key value. ");
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
	if (getCol(col.name).type != Type::Null)
	{
		throw std::invalid_argument("Columns already exists: " + col.name);
	}
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
		std::string message = "Amount of arguments to be inserted doesn't match size of columns:\nGiven: " + std::to_string(values.size());
		message += "\nNeeded: " + std::to_string(columns.size());
		throw std::invalid_argument(message);
	}

	DataRow row;
	for (std::size_t i = 0; i < columns.size(); ++i)
	{
		row.add(columns[i], values[i]);
	}

	if (primary_key.type != Type::Null)
	{
		check_key(row[primary_key]);
	}

	rows.push_back(row);
}

std::size_t Table::update(const std::vector<std::string>& cols, const std::vector<std::string>& values, const std::string& key, const std::string& op, const std::string& keyValue)
{
	std::vector<DataColumn> dataCols;
	DataColumn colKey = getCol(key);

	if (colKey.type == Type::Null)
	{
		std::string message = "ERROR:Unrecognised column: " + key;
		throw std::invalid_argument(message);
	}

	for (std::size_t i = 0; i < cols.size(); ++i)
	{
		DataColumn dataCol = getCol(cols[i]);
		if (dataCol.type == Type::Null)
		{
			std::string message = "ERROR:Unrecognised column: " + cols[i];
			throw std::invalid_argument(message);
		}
		dataCols.push_back(dataCol);

		// Duplicate on primary key check
		if (dataCol == primary_key)
		{
			check_key(values[i]);
		}
	}

	if (dataCols.size() != values.size())
	{
		throw std::runtime_error("ERROR:Size of columns doesn't match size of values.");
	}

	std::size_t updatedRows = 0;

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
				++updatedRows;
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
				++updatedRows;
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
				++updatedRows;
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
				++updatedRows;
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
			++updatedRows;
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
			++updatedRows;
		}
	}

	return updatedRows;
}

Table Table::orderBy(const std::string& col, const bool& asc) const
{
	Table res;
	res.columns = columns;
	res.primary_key = primary_key;

	DataColumn dataCol = getCol(col);
	if (dataCol.type == Type::Null)
	{
		throw std::invalid_argument("Column doesn't exist: " + col);
	}

	// If an index with col exists, and we are not in an anonymous table
	if (name != "")
	{
		std::string fileName = this->name + "_" + col + ".bin";
		std::fstream in(fileName, std::ios::in | std::ios::binary);

		if (in.good())
		{
			
			BTree tree;
			tree.deserialize(in);
			in.close();
			std::vector<std::streampos> positions = tree.inorderTraversal();

			std::fstream temp(this->name + ".bin", std::ios::in | std::ios::binary);

			for (const std::streampos& pos : positions)
			{

				DataRow row;

				temp.seekg(pos);

				row.deserialize(temp);

				res.rows.push_back(row);
			}

			temp.close();

			if (!asc)
			{
				std::reverse(res.rows.begin(), res.rows.end());
			}

			return res;
		}
	}

	// We will be sorting the rows manually if there is no index
	res.rows = rows;

	for (std::size_t i = 0; i < res.rows.size(); ++i)
	{
		std::size_t top = i;
		for (std::size_t j = i + 1; j < rows.size(); ++j)
		{
			if (res.rows[top].compare(dataCol, res.rows[j]) == -1 && !asc)
			{
				top = j;
			}
			else if (res.rows[top].compare(dataCol, res.rows[j]) == 1 && asc)
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

Table Table::filterBy(const std::string& col, const std::string& op, const std::string& value) const
{
	Table res;
	res.columns = columns;
	res.primary_key = primary_key;

	DataColumn dataCol = getCol(col);
	if (dataCol.type == Type::Null)
	{
		throw std::invalid_argument("Column doesn't exist: " + col);
	}

	// If an index with col exists, and we are not in an anonymous table
	if (name != "" && op == "=")
	{
		std::string fileName = this->name + "_" + col + ".bin";
		std::fstream in(fileName, std::ios::in | std::ios::binary);

		if (in.good())
		{
			BTree tree;
			tree.deserialize(in);
			in.close();
			std::vector<std::streampos> positions = tree.search(value);

			std::fstream temp(this->name + ".bin", std::ios::in | std::ios::binary);
			
			for (const std::streampos& pos : positions)
			{

				DataRow row;

				temp.seekg(pos);

				row.deserialize(temp);

				res.rows.push_back(row);
			}

			temp.close();

			return res;
		}
	}
	
	// If we don't have an index, we go through all records
	for (DataRow row : rows)
	{
		// Making temporary row for the comparison
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
				DataColumn myCol = getCol(cols[i]);
				std::cout << row[myCol];
				if (i != cols.size() - 1)
				{
					std::cout << ", ";
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
	std::fstream is(fileName, std::ios::in | std::ios::binary);

	if (!is.good())
	{
		std::string message = "Unrecognised table: " + this->name;
		throw std::invalid_argument(message);
	}

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

void Table::createIndex(const std::string& col) const
{
	// We will read the current table from it's file and give the locations of the DataRow data to each node in the tree
	// and insert the key (the given column value).
	std::string tableFileName = this->name + ".bin";
	std::fstream is(tableFileName, std::ios::in);

	if (!is.good())
	{
		throw std::runtime_error("ERROR:Attempted to create an index on an unknown table.");
	}

	std::size_t columnsLength, rowsLength;
	is.read(reinterpret_cast<char*>(&columnsLength), sizeof(std::size_t));
	is.read(reinterpret_cast<char*>(&rowsLength), sizeof(std::size_t));

	DataColumn dataCol;
	dataCol.type = Type::Null;

	for (std::size_t i = 0; i < columnsLength; ++i)
	{
		DataColumn temp;
		temp.deserialize(is);
		if (temp.name == col)
		{
			dataCol.name = temp.name;
			dataCol.type = temp.type;
		}
	}

	if (dataCol.type == Type::Null)
	{
		std::string message = "Column doesn't exist: " + col + ".";
		throw std::invalid_argument(message);
	}

	BTree indexTree(dataCol.type, 2, nullptr);

	for (std::size_t i = 0; i < rowsLength; ++i)
	{
		DataRow row;
		std::streampos pointer = is.tellg();
		row.deserialize(is);
		indexTree.insert(row[dataCol], pointer);
		// rows.push_back(row);
	}

	// this->primary_key.deserialize(is);

	is.close();

	// The name of the file where the index will be stored
	std::string fileName = this->name + "_" + col + ".bin";
	std::fstream os(fileName, std::ios::out | std::ios::binary);
	indexTree.serialize(os);
	os.close();
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
