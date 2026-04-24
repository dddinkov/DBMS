#pragma once

#include <vector>
#include "condition.h"

/// <summary>
/// Struct AssignOperations
/// 
/// Following the following grammar rule:
/// ASSIGN_OPERATIONS = COLUMN "=" LITERAL [, ASSIGN_OPERATIONS]
/// </summary>
struct AssignOperations
{
	/// <summary>
	/// A vector field storing the assign operations (conditions).
	/// 
	/// An assign operation looks like this: <column> = <value>
	/// </summary>
	std::vector<Condition> conds;

	/// <summary>
	/// A default constructor.
	/// </summary>
	AssignOperations();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	AssignOperations(const std::vector<Condition>&);

	/// <summary>
	/// operator>> overload for inputting AssignOperations.
	/// </summary>
	friend std::istream& operator>>(std::istream&, AssignOperations&);
};