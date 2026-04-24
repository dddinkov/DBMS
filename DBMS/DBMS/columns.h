#pragma once

#include "queryArguments.h"

/// <summary>
/// Class Columns, inherits from QueryArguments.
/// 
/// Following the following rule from the grammar:
/// COLUMNS = COLUMN [, COLUMNS]
/// </summary>
class Columns : public QueryArguments
{
private:
	/// <summary>
	/// A vector of column identifiers. 
	/// 
	/// Can include "*".
	/// </summary>
	std::vector<std::string> cols;
public:
	/// <summary>
	/// A default constructor.
	/// </summary>
	Columns();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	Columns(std::vector<std::string>&);

	/// <summary>
	/// A print function (overriden) to display the columns.
	/// </summary>
	/// <param name="">A Table</param>
	void print(const Table&) const;

	/// <summary>
	/// A clone function.
	/// </summary>
	QueryArguments* clone() const;

	/// <summary>
	/// operator>> overload for inputting Columns.
	/// </summary>
	friend std::istream& operator>>(std::istream&, Columns*&);
};