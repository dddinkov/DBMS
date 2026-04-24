#include "columns.h"
#include "tokenizer.h"
#include <exception>

Columns::Columns() {}

Columns::Columns(std::vector<std::string>& cols)
{
	this->cols = cols;
}


void Columns::print(const Table& table) const
{
	table.print(cols);

	std::size_t size = table.size();
	if (size > 0 || size == 0)
	{
		std::cout << table.size() << " rows selected." << std::endl;
	}
	else
	{
		std::cout << table.size() << " row selected." << std::endl;
	}
}

QueryArguments* Columns::clone() const
{
	return new Columns(*this);
}

std::istream& operator>>(std::istream& istr, Columns*& cols)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	if (token.type != Tokenizer::IDENTIFIER)
	{
		cols = nullptr;
		return istr;
	}

	cols = new Columns();

	while (token.type == Tokenizer::IDENTIFIER)
	{
		cols->cols.push_back(token.value);
		tokenizer.getNextToken();

		token = tokenizer.peek();

		if (token.value == ",")
		{
			tokenizer.getNextToken();

			token = tokenizer.peek();
			if (token.type != Tokenizer::IDENTIFIER)
			{
				delete cols;
				cols = nullptr;

				std::string message = "Unexpected token: " + token.value + ".\nExpected: IDENTIFIER";
				throw std::invalid_argument(message);
			}
		}
	}

	return istr;
}
