#include "queryArguments.h"
#include "tokenizer.h"
#include "columns.h"
#include "aggregates.h"

std::istream& operator>>(std::istream& istr, QueryArguments*& queryArguments)
{
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

	queryArguments = nullptr;
	throw std::exception("ERROR:Query arguments couldn't be parsed.");
	return istr;
}

QueryArguments::~QueryArguments() {}