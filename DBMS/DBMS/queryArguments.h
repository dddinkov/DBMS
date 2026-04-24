#pragma once

#include <iostream>
#include "table.h"

/// <summary>
/// Abstract class QueryArgumets
/// 
/// Following the following grammar rule:
/// QUERY_ARGUMENTS = COLUMNS | AGGREGATES
/// </summary>
class QueryArguments
{
public:
	/// <summary>
	/// Pure virtual print function to display the columns/aggregate values (query arguments).
	/// </summary>
	/// <param name="">A Table</param>
	virtual void print(const Table&) const = 0;

	/// <summary>
	/// A clone function.
	/// </summary>
	virtual QueryArguments* clone() const = 0;

	/// <summary>
	/// operator>> overload for inputting QueryArguments.
	/// </summary>
	friend std::istream& operator>>(std::istream&, QueryArguments*&);

	/// <summary>
	/// A default destructor.
	/// </summary>
	~QueryArguments() = default;
};


