#pragma once

#include <string>

/// <summary>
/// Struct Condition
/// 
/// Following the following grammar rule:
/// CONDITION = COLUMN OPERATOR LITERAL
/// </summary>
struct Condition
{
	/// <summary>
	/// The column identifier.
	/// </summary>
	std::string col;

	/// <summary>
	/// The operator.
	/// </summary>
	std::string op;

	/// <summary>
	/// The literal vlue.
	/// </summary>
	std::string value;

	/// <summary>
	/// A default constructor.
	/// </summary>
	Condition();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	Condition(const std::string&, const std::string&, const std::string&);

	/// <summary>
	/// operator>> overload for inputting a Condition.
	/// </summary>
	friend std::istream& operator>>(std::istream&, Condition&);
};