#pragma once

#include "queryArguments.h"
#include "aggregate.h"

class Aggregates : public QueryArguments
{
private:
	std::vector<Aggregate> aggregates;

public:
	Aggregates();
	Aggregates(const std::vector<Aggregate>&);

	void print(const Table&) const;

	QueryArguments* clone() const;

	friend std::istream& operator>>(std::istream&, Aggregates*&);
};