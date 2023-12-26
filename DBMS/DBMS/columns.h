#pragma once

#include "queryArguments.h"

class Columns : public QueryArguments
{
private:
	std::vector<std::string> cols;
public:
	Columns();
	Columns(std::vector<std::string>&);

	void print(const Table&) const;

	QueryArguments* clone() const;

	friend std::istream& operator>>(std::istream&, Columns*&);
};