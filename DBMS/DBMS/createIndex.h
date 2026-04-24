#pragma once

#include "operation.h"
#include <string>

/// <summary>
/// Class CreateIndex, inherits from Operation.
/// 
/// Following the following rule from the grammar:
/// CREATE_INDEX = "CREATE" "INDEX" "on" TABLE "(" COLUMN ")" ";"
/// </summary>
class CreateIndex : public Operation
{
private:
	/// <summary>
	/// The table identifier.
	/// </summary>
	std::string table;

	/// <summary>
	/// A column identifier for the index.
	/// </summary>
	std::string col;
public:
	/// <summary>
	/// A default constructor.
	/// </summary>
	CreateIndex();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	CreateIndex(const std::string&, const std::string&);

	/// <summary>
	/// CreateIndex evaluation function.
	/// </summary>
	void eval() const;

	/// <summary>
	/// A clone function.
	/// </summary>
	Operation* clone() const;

	/// <summary>
	/// operator>> overload for inputting a CreateIndex operation.
	/// </summary>
	friend std::istream& operator>>(std::istream&, CreateIndex*&);
};