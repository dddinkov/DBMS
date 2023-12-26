#pragma once

#include <vector>
#include <string>

struct Values
{
	std::vector<std::string> literals;

	Values();
	Values(const std::vector<std::string>&);

	friend std::istream& operator>>(std::istream&, Values&);
};