#pragma once 

#include "operation.h"
#include "assignOperations.h"
#include "whereClause.h"
#include <string>

/// <summary>
/// Class Update, inherits from Operation.
/// 
/// Following the following rule from the grammar:
/// UPDATE = "UPDATE" TABLE "SET" ASSIGN_OPERATIONS WHERE_CLAUSE ";"
/// </summary>
class Update : public Operation
{
private:
	/// <summary>
	/// The table identifier.
	/// </summary>
	std::string table;

	/// <summary>
	/// AssignOperations field for storing operations of type <column><operator><value>
	/// </summary>
	AssignOperations operations;

	/// <summary>
	/// WhereClause field to store the condition for updating table rows.
	/// </summary>
	WhereClause whereClause;

public:
	/// <summary>
	/// A default constructor.
	/// </summary>
	Update();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	Update(const std::string&, const AssignOperations&, const WhereClause&);

	/// <summary>
	/// Update evaluation function.
	/// </summary>
	void eval() const;

	/// <summary>
	/// A clone function.
	/// </summary>
	Operation* clone() const;

	/// <summary>
	/// operator>> overload for inputting an Update operation.
	/// </summary>
	friend std::istream& operator>>(std::istream&, Update*&);
};
