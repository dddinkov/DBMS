#pragma once

#include <string>

struct OrderByClause
{
	std::string col;
	bool asc;

	OrderByClause();
	OrderByClause(const std::string&, const bool&);

	friend std::istream& operator>>(std::istream&, OrderByClause&);
};
