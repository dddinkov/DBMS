#pragma once

#include <iostream>
#include "table.h"

class QueryArguments
{
public:
	virtual void print(const Table&) const = 0;

	virtual QueryArguments* clone() const = 0;

	friend std::istream& operator>>(std::istream&, QueryArguments*&);

	~QueryArguments();
};


