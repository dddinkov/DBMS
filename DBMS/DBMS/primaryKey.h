#pragma once

#include <string>

/// <summary>
/// Struct PrimaryKey
/// 
/// Following the following grammar rule:
/// PRIMARY_KEY = "PRIMARY" "KEY" COLUMN
/// </summary>
struct PrimaryKey
{
	/// <summary>
	/// The column identifier.
	/// </summary>
	std::string col;

	/// <summary>
	/// A default constructor.
	/// </summary>
	PrimaryKey();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	PrimaryKey(const std::string&);

	/// <summary>
	/// operator>> overload for inputting a PrimaryKey.
	/// </summary>
	friend std::istream& operator>>(std::istream&, PrimaryKey&);
};