#include "columnDatatypePairs.h"
#include "tokenizer.h"
#include <exception>

ColumnDatatypePairs::ColumnDatatypePairs() {}

ColumnDatatypePairs::ColumnDatatypePairs(const std::vector<std::pair<std::string, std::string>>& pairs)
{
	this->pairs = pairs;
}

std::istream& operator>>(std::istream& istr, ColumnDatatypePairs& colTypePairs)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	do
	{
		if (token.value == ",")
		{
			tokenizer.getNextToken();
			token = tokenizer.peek();
		}

		std::pair<std::string, std::string> toPush;

		if (token.type != Tokenizer::IDENTIFIER)
		{
			std::string message = "Unexpected token: " + token.value + ".\nExpected: IDENTIFIER.";
			throw std::invalid_argument(message);
		}
		toPush.first = token.value;

		tokenizer.getNextToken();

		token = tokenizer.peek();
		if (token.type != Tokenizer::DATATYPE)
		{
			std::string message = "Unexpected token: " + token.value + ".\nExpected: DATATYPE.";
			throw std::invalid_argument(message);
		}
		toPush.second = token.value;

		colTypePairs.pairs.push_back(toPush);

		tokenizer.getNextToken();

		token = tokenizer.peek();

	} while (token.value == ",");

	return istr;
}