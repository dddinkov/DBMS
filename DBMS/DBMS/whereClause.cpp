#include "whereClause.h"
#include "tokenizer.h"
#include <exception>

WhereClause::WhereClause() {}

WhereClause::WhereClause(const Condition& cond)
{
	this->cond = cond;
}

std::istream& operator>>(std::istream& istr, WhereClause& clause)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	if (token.value != "WHERE")
	{
		throw "Error: WHERE clause is missing.";
	}

	tokenizer.getNextToken();

	istr >> clause.cond;
	return istr;
}
