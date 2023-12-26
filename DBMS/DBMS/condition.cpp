#include "condition.h"
#include "tokenizer.h"
#include <exception>

Condition::Condition() {}

Condition::Condition(const std::string& col, const std::string& op, const std::string& value)
{
	this->col = col;
	this->op = op;
	this->value = value;
}

std::istream& operator>>(std::istream& istr, Condition& cond)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	if (token.type != Tokenizer::IDENTIFIER)
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: IDENTIFIER";
		throw std::invalid_argument(message);
	}
	cond.col = token.value;

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.type != Tokenizer::OPERATOR)
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: OPERATOR";
		throw std::invalid_argument(message);
	}
	cond.op = token.value;

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.type != Tokenizer::LITERAL)
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: LITERAL";
		throw std::invalid_argument(message);
	}
	cond.value = token.value;

	tokenizer.getNextToken();

	return istr;
}
