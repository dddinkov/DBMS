#pragma once

#include <vector>
#include "whereClause.h"

/// <summary>
/// Struct WhereClauses
/// 
/// Following the following grammar rule:
/// WHERE_CLAUSES = WHERE_CLAUSE [WHERE_CLAUSES]
/// </summary>
struct WhereClauses
{
	/// <summary>
	/// This fields holds the WhereClause(s).
	/// </summary>
	std::vector<WhereClause> whereClauses;

	/// <summary>
	/// A default constructor.
	/// </summary>
	WhereClauses();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	WhereClauses(const std::vector<WhereClause>&);

	/// <summary>
	/// operator>> overload for inputting WhereClauses.
	/// </summary>
	friend std::istream& operator>>(std::istream&, WhereClauses&);
};