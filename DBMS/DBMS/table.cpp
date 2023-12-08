#pragma once

#include "table.h"
#include <iomanip>
#include <exception>
#include <cstddef>
#include <iostream>

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

Table::Table()
{
	columns = std::vector<DataColumn>();
	rows = std::vector<DataRow>();
	primary_key = DataColumn{"", Type::Null};
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

Table Table::orderBy(const std::vector<DataColumn>& cols, const std::vector<bool>& desc) const
{
	Table res;
	res.columns = columns;
	res.rows = rows;
	res.primary_key = primary_key;
	for (std::size_t i = 0; i < res.rows.size(); ++i)
	{
		std::size_t top = i;
		for (std::size_t j = i + 1; j < rows.size(); ++j)
		{
			std::size_t colIndex = 0;
			while (colIndex < cols.size() && res.rows[top].compare(cols[colIndex], res.rows[j]) == 0)
			{
				colIndex++;
			}
			if (colIndex < cols.size())
			{
				if (res.rows[top].compare(cols[colIndex], res.rows[j]) == -1 && desc[colIndex]) // desc
				{
					top = j;
				}
				else if (res.rows[top].compare(cols[colIndex], res.rows[j]) == 1 && !desc[colIndex]) // asc
				{
					top = j;
				}
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

Table Table::filterBy(const std::vector<DataColumn>& cols, const std::vector<std::function<bool(const DataColumn&, const DataRow&)>> predicates)
{
	Table res;
	res.columns = columns;
	res.primary_key = primary_key;
	for (DataRow row : rows)
	{
		bool pass = true;
		for (std::size_t i = 0; i < cols.size(); ++i)
		{
			if (!predicates[i](cols[i], row))
			{
				pass = false;
			}
		}
		if (pass)
		{
			res.rows.push_back(row);
		}
	}
	return res;
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
		os << row;
	}
	return os;
}
