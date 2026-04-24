#pragma once

#include "operation.h"
#include "values.h"
#include <string>

/// <summary>
/// Class InsertInto, inherits Operation.
/// 
/// Following the following grammar rule:
/// INSERT_INTO = "INSERT" "INTO" TABLE "(" VALUES ")" ";"
/// </summary>
class InsertInto : public Operation
{
private:
	/// <summary>
	/// The table identifier.
	/// </summary>
	std::string table;
	/// <summary>
	/// Values field storing the literals to be inserted in the table.
	/// </summary>
	Values values;

public:
	/// <summary>
	/// A default constructor.
	/// </summary>
	InsertInto();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	InsertInto(const std::string&, const Values&);

	/// <summary>
	/// InsertInto evaluation function.
	/// </summary>
	void eval() const;

	/// <summary>
	/// A clone function.
	/// </summary>
	Operation* clone() const;

	/// <summary>
	/// operator>> overload for inputting a InsertInto operation.
	/// </summary>
	friend std::istream& operator>>(std::istream&, InsertInto*&);
};