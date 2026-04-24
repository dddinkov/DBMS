#pragma once

#include <utility>
#include <vector>
#include <string>

/// <summary>
/// Struct ColumnDatatypePairs
/// 
/// Following the following grammar rule:
/// COLUMN_DATATYPE_PAIRS = COLUMN DATATYPE [, COLUMN_DATATYPE_PAIRS]
/// </summary>
struct ColumnDatatypePairs
{
	/// <summary>
	/// A vector to hold pairs of column identifier - datatype.
	/// </summary>
	std::vector<std::pair<std::string, std::string>> pairs;

	/// <summary>
	/// A default constructor.
	/// </summary>
	ColumnDatatypePairs();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	ColumnDatatypePairs(const std::vector<std::pair<std::string, std::string>>&);

	/// <summary>
	/// operator>> overload for inputting ColumnDatatypePairs.
	/// </summary>
	friend std::istream& operator>>(std::istream&, ColumnDatatypePairs&);
};