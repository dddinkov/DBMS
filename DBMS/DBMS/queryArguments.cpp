#include "queryArguments.h"
#include "tokenizer.h"
#include "columns.h"
#include "aggregates.h"

std::istream& operator>>(std::istream& istr, QueryArguments*& queryArguments)
{
	queryArguments = nullptr;

	Columns* cols;
	istr >> cols;
	if (cols != nullptr)
	{
		queryArguments = cols;
		return istr;
	}

	Aggregates* agg;
	istr >> agg;
	if (agg != nullptr)
	{
		queryArguments = agg;
		return istr;
	}

	throw std::runtime_error("ERROR:Query arguments couldn't be parsed.");
	return istr;
}