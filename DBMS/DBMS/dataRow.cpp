#include "dataRow.h"
#include <vector>
#include <exception>
#include <iostream>
#include <iomanip>

DataRow::DataRow()
{
	record = std::unordered_map<DataColumn, std::string>();
}

void DataRow::add(const DataColumn& key, const std::string& val)
{
	validate(key, val);
	record.insert(std::pair<const DataColumn, std::string>(key, val));
}

void DataRow::update(const DataColumn& key, const std::string& newVal)
{
	validate(key, newVal);
	record[key] = newVal;
}

std::string DataRow::operator[](const DataColumn& col) const
{
	return record.at(col);
}

void DataRow::serialize(std::fstream& os)
{
	std::size_t recordSize = record.size();
	os.write(reinterpret_cast<const char*>(&recordSize), sizeof(std::size_t));

	for (std::pair<const DataColumn, std::string>& pair : record)
	{
		std::size_t valueLength = pair.second.size();
		os.write(reinterpret_cast<const char*>(&valueLength), sizeof(std::size_t));
		os.write(pair.second.c_str(), valueLength);
	}

	for (std::pair<DataColumn, std::string> pair : record)
	{
		pair.first.serialize(os);
	}
}

void DataRow::deserialize(std::fstream& istr)
{
	std::size_t recordSize;
	istr.read(reinterpret_cast<char*>(&recordSize), sizeof(std::size_t));

	std::vector<std::string> values;
	for (std::size_t i = 0; i < recordSize; ++i)
	{
		std::size_t valueLength;
		istr.read(reinterpret_cast<char*>(&valueLength), sizeof(std::size_t));
		char* buffer = new char[valueLength + 1];
		istr.read(buffer, valueLength);
		buffer[valueLength] = '\0';
		values.push_back(buffer);
	}

	for (std::size_t i = 0; i < recordSize; ++i)
	{
		DataColumn key;
		key.deserialize(istr);

		record.insert(std::pair<DataColumn, std::string>(key, values[i]));
	}
}

void DataRow::validate(const DataColumn& key, const std::string& val)
{
	if (key.type == Type::String && val[0] != '\"' && val[val.size() - 1] != '\"')
	{
		throw std::runtime_error("Trying to alter field with type string went wrong.");
	}
	else if (key.type == Type::Bool &&
		!(val == "TRUE" || val == "FALSE"))
	{
		throw std::runtime_error("Trying to alter field with type bool went wrong.");
	}
	else if (key.type == Type::Int && val.find('.') != -1)
	{
		throw std::runtime_error("Trying to alter field with type int went wrong.");
	}
	else if (key.type == Type::Int)
	{
		try
		{
			double temp = std::stoi(val);
		}
		catch (std::exception)
		{
			throw std::runtime_error("Trying to alter field with type int went wrong.");
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
			throw std::runtime_error("Trying to alter field with type double went wrong.");
		}
	}
}

std::ostream& operator<<(std::ostream& os, const DataRow& row)
{
	for (const std::pair<DataColumn, std::string>& pair : row.record)
	{
		os << pair.second;
		os << " ";
	}
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
		if (record[col] == "TRUE")
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