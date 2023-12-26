#include "aggregate.h"
#include "tokenizer.h"
#include <exception>

Aggregate::Aggregate() {}

Aggregate::Aggregate(const std::string& type, const std::string& col)
{
	this->type = type;
	this->col = col;
}

std::istream& operator>>(std::istream& istr, Aggregate& aggregate)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	if (token.type != Tokenizer::KEYWORD)
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: AGGREGATE";
		throw std::invalid_argument(message);
	}

	if (token.value == "MIN" || token.value == "MAX" || token.value == "AVG" || token.value == "SUM" || token.value == "COUNT")
	{
		aggregate.type = token.value;
	}
	else
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: AGGREGATE";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();
	if (token.value != "(")
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: (";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();
	if (token.type != Tokenizer::IDENTIFIER)
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: IDENTIFIER";
		throw std::invalid_argument(message);
	}
	aggregate.col = token.value;

	tokenizer.getNextToken();

	token = tokenizer.peek();
	if (token.value != ")")
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: )";
		throw std::invalid_argument(message);
	}

	return istr;
}