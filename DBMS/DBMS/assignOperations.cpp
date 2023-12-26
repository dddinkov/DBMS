#include "assignOperations.h"
#include "tokenizer.h"
#include <exception>

AssignOperations::AssignOperations() {}

AssignOperations::AssignOperations(const std::vector<Condition>& conds)
{
	this->conds = conds;
}

std::istream& operator>>(std::istream& istr, AssignOperations& assignOps)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	do
	{
		if (token.value == ",")
		{
			tokenizer.getNextToken();
		}
		Condition cond;
		istr >> cond;

		if (cond.op != "=")
		{
			std::string message = "Unexpected token: " + cond.op + ".\nExpected: =";
			throw std::invalid_argument(message);
		}

		assignOps.conds.push_back(cond);

		token = tokenizer.peek();
	} while (token.value == ",");

	return istr;
}