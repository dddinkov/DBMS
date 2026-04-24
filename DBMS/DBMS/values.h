#pragma once

#include <vector>
#include <string>

/// <summary>
/// Struct Values
/// 
/// Following the following grammar rule:
/// VALUES = LITERAL[, VALUES]
/// </summary>
struct Values
{
	/// <summary>
	/// A vector of the stored literals (values).
	/// </summary>
	std::vector<std::string> literals;

	/// <summary>
	/// A default constructor.
	/// </summary>
	Values();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	Values(const std::vector<std::string>&);

	/// <summary>
	/// operator>> overload for inputting Values.
	/// </summary>
	friend std::istream& operator>>(std::istream&, Values&);
};