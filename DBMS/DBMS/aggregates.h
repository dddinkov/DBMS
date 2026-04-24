#pragma once

#include "queryArguments.h"
#include "aggregate.h"

/// <summary>
/// Class Aggregates, inherits from QueryArguments.
/// 
/// Following the following rule from the grammar:
/// AGGREGATES = AGGREGATE [, AGGREGATES]
/// </summary>
class Aggregates : public QueryArguments
{
private:
	/// <summary>
	/// A vector holding each aggregate.
	/// </summary>
	std::vector<Aggregate> aggregates;

public:
	/// <summary>
	/// A default constructor.
	/// </summary>
	Aggregates();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	Aggregates(const std::vector<Aggregate>&);

	/// <summary>
	/// A print function (overriden) to display the aggregates.
	/// </summary>
	/// <param name="">A Table</param>
	void print(const Table&) const;

	/// <summary>
	/// A clone function.
	/// </summary>
	QueryArguments* clone() const;

	/// <summary>
	/// operator>> overload for inputting Aggregates.
	/// </summary>
	friend std::istream& operator>>(std::istream&, Aggregates*&);
};