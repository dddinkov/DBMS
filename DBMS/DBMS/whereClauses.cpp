#include "whereClauses.h"
#include "tokenizer.h"

WhereClauses::WhereClauses() {};

WhereClauses::WhereClauses(const std::vector<WhereClause>& whereClauses)
{
	this->whereClauses = whereClauses;
}

std::istream& operator>>(std::istream& istr, WhereClauses& clauses)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	if (token.type != Tokenizer::KEYWORD || token.value != "WHERE")
	{
		return istr;
	}


	while (token.value == "WHERE")
	{
		WhereClause toPush;
		istr >> toPush;
		clauses.whereClauses.push_back(toPush);

		token = tokenizer.peek();
	}
	return istr;
}