#pragma once

#include <string>

/// <summary>
/// Struct Aggregate
/// 
/// Follows the following grammar rule:
/// AGGREGATE = AGGREGATE_KEYWORD "(" COLUMN ")"
/// </summary>
struct Aggregate
{
	/// <summary>
	/// The aggregate keyword (MIN, MAX, SUM, AVG, COUNT).
	/// </summary>
	std::string type;

	/// <summary>
	/// The column identifier.
	/// </summary>
	std::string col;

	/// <summary>
	/// A default constructor.
	/// </summary>
	Aggregate();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	Aggregate(const std::string&, const std::string&);

	/// <summary>
	/// operator>> overload for inputting an Aggregate.
	/// </summary>
	friend std::istream& operator>>(std::istream&, Aggregate&);
};