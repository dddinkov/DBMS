#include "orderByClause.h"
#include "tokenizer.h"
#include <exception>

OrderByClause::OrderByClause() : asc(true) {}

OrderByClause::OrderByClause(const std::string& col, const bool& asc)
{
	this->col = col;
	this->asc = asc;
}

std::istream& operator>>(std::istream& istr, OrderByClause& clause)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	if (token.value != "ORDER")
	{
		return istr;
	}
	tokenizer.getNextToken();

	token = tokenizer.peek();
	if (token.value != "BY")
	{
		std::string message = "Unexpected token: " + token.value + "\nExpected: BY.";
		throw std::invalid_argument(message);
	}
	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.type != Tokenizer::IDENTIFIER)
	{
		std::string message = "Unexpected token: " + token.value + "\nExpected: IDENTIFIER.";
		throw std::invalid_argument(message);
	}
	clause.col = token.value;

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value == "DESC")
	{
		clause.asc = false;
	}
	else if (token.value == "ASC")
	{
		clause.asc = true;
	}
	else
	{
		std::string message = "Unexpected token: " + token.value + "\nExpected: ASC or DESC.";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	return istr;
}