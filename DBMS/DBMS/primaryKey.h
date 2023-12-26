#pragma once

#include <string>

struct PrimaryKey
{
	std::string col;

	PrimaryKey();
	PrimaryKey(const std::string&);

	friend std::istream& operator>>(std::istream&, PrimaryKey&);
};