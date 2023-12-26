#include "primaryKey.h"
#include "tokenizer.h"
#include <exception>

PrimaryKey::PrimaryKey() {}

PrimaryKey::PrimaryKey(const std::string& col)
{
	this->col = col;
}

std::istream& operator>>(std::istream& istr, PrimaryKey& pk)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();
	if (token.value != "PRIMARY")
	{
		pk.col = "";
		return istr;
	}
	tokenizer.getNextToken();

	token = tokenizer.peek();
	if (token.value != "KEY")
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: KEY.";
		throw std::invalid_argument(message);
	}
	tokenizer.getNextToken();

	token = tokenizer.peek();
	if (token.type != Tokenizer::IDENTIFIER)
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: IDENTIFIER.";
		throw std::invalid_argument(message);
	}
	pk.col = token.value;

	tokenizer.getNextToken();
	return istr;
}
