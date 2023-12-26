#pragma once

#include <vector>
#include "whereClause.h"

struct WhereClauses
{
	std::vector<WhereClause> whereClauses;

	WhereClauses();
	WhereClauses(const std::vector<WhereClause>&);

	friend std::istream& operator>>(std::istream&, WhereClauses&);
};