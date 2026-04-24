#pragma once

#include <string>

/// <summary>
/// Struct OrderByClause
/// 
/// Following the following grammar rule:
/// ORDER_BY_CLAUSE = "ORDER" "BY" CONDITION
/// </summary>
struct OrderByClause
{
	/// <summary>
	/// The column identifier to order the rows by.
	/// </summary>
	std::string col;

	/// <summary>
	/// A boolean showing whether the order is ascending (true) or descending (false).
	/// </summary>
	bool asc;

	/// <summary>
	/// A default constructor.
	/// </summary>
	OrderByClause();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	OrderByClause(const std::string&, const bool&);

	/// <summary>
	/// operator>> overload for inputting a OrderByClause.
	/// </summary>
	friend std::istream& operator>>(std::istream&, OrderByClause&);
};
