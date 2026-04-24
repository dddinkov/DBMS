#pragma once

#include "condition.h"

/// <summary>
/// Struct WhereClause
/// 
/// Following the following grammar rule:
/// WHERE_CLAUSE = "WHERE" CONDITION
/// </summary>
struct WhereClause
{
	/// <summary>
	/// A field storing the condition of the WhereClause.
	/// </summary>
	Condition cond;

	/// <summary>
	/// A default constructor.
	/// </summary>
	WhereClause();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	WhereClause(const Condition&);

	/// <summary>
	/// operator>> overload for inputting a WhereClause.
	/// </summary>
	friend std::istream& operator>>(std::istream&, WhereClause&);
};