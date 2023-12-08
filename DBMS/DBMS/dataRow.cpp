#pragma once
#include "dataRow.h"
#include <exception>
#include <iostream>
#include <iomanip>

DataRow::DataRow()
{
	record = std::unordered_map<DataColumn, std::string>();
}

void DataRow::add(const DataColumn& key, const std::string& val)
{
	try
	{
		validate(key, val);
		std::pair<const DataColumn, std::string> pair(key, val);
		record.insert(pair);
	}
	catch (std::exception e)
	{
		std::cout << e.what()  << std::endl;
	}
}

void DataRow::update(const DataColumn& key, const std::string& newVal)
{
	try
	{
		validate(key, newVal);
		record[key] = newVal;
	}
	catch (std::exception e)
	{
		std::cout << e.what() << std::endl;
	}
}

std::string DataRow::operator[](const DataColumn& col) const
{
	// !!! nullptr !!!
	return record.find(col)->second;
}

void DataRow::validate(const DataColumn& key, const std::string& val)
{
	if (key.type == Type::Int)
	{
		try
		{
			int temp = std::stoi(val);
		}
		catch (std::exception)
		{
			throw std::exception("Trying to alter field with type Int went wrong.");
		}
	}
	else if (key.type == Type::Double)
	{
		try
		{
			double temp = std::stod(val);
		}
		catch (std::exception)
		{
			throw std::exception("Trying to alter field with type Double went wrong.");
		}
	}
	else if (key.type == Type::Bool &&
		!(val == "True" || val == "False"))
	{
		throw std::exception("Trying to alter field with type Bool went wrong.");
	}
}

std::ostream& operator<<(std::ostream& os, const DataRow& row)
{
	for (std::pair<DataColumn, std::string> pair : row.record)
	{
		if (pair.first.type == Type::String)
		{
			std::string toPrint = "\"" + pair.second + "\"";
			os << std::left << std::setw(20) << toPrint;
		}
		else
		{
			os << std::left << std::setw(20) << pair.second;
		}

	}
	os << '\n';
	return os;
}

int DataRow::compare(const DataColumn& col, const DataRow& row)
{
	if (record[col] == row[col])
	{
		return 0;
	}
	if (col.type == Type::Bool)
	{
		if (record[col] == "True")
		{
			return 1;
		}
		else return -1;
	}
	else if (col.type == Type::Double)
	{
		double left = std::stod(record[col]);
		double right = std::stod(row[col]);
		if (left < right)
		{
			return -1;
		}
		else
		{
			return 1;
		}
	}
	else if (col.type == Type::Int)
	{
		double left = std::stoi(record[col]);
		double right = std::stoi(row[col]);
		if (left < right)
		{
			return -1;
		}
		else
		{
			return 1;
		}
	}
	else if (col.type == Type::String)
	{
		if (record[col] < row[col])
		{
			return -1;
		}
		else
		{
			return 1;
		}
	}
	return 0;
}