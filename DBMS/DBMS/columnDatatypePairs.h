#pragma once

#include <utility>
#include <vector>
#include <string>

struct ColumnDatatypePairs
{
	std::vector<std::pair<std::string, std::string>> pairs;

	ColumnDatatypePairs();
	ColumnDatatypePairs(const std::vector<std::pair<std::string, std::string>>&);

	friend std::istream& operator>>(std::istream&, ColumnDatatypePairs&);
};