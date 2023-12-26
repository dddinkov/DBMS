#include "values.h"
#include "Tokenizer.h"

Values::Values() {}

Values::Values(const std::vector<std::string>& literals)
{
	this->literals = literals;
}

std::istream& operator>>(std::istream& istr, Values& values)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	while (token.type == Tokenizer::LITERAL)
	{
		values.literals.push_back(token.value);

		tokenizer.getNextToken();

		token = tokenizer.peek();
		if (token.value == ",")
		{
			tokenizer.getNextToken();

			token = tokenizer.peek();
		}
	}
	return istr;
}
