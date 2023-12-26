#pragma once

#include <string>

struct Condition
{
	std::string col;
	std::string op;
	std::string value;

	Condition();
	Condition(const std::string&, const std::string&, const std::string&);

	friend std::istream& operator>>(std::istream&, Condition&);
};