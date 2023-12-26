#pragma once

#include <string>

struct Aggregate
{
	std::string type;
	std::string col;

	Aggregate();
	Aggregate(const std::string&, const std::string&);

	friend std::istream& operator>>(std::istream&, Aggregate&);
};