#pragma once

#include "condition.h"

struct WhereClause
{
	Condition cond;

	WhereClause();
	WhereClause(const Condition&);

	friend std::istream& operator>>(std::istream&, WhereClause&);
};