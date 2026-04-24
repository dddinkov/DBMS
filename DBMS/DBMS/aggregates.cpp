#include "aggregates.h"
#include "tokenizer.h"
#include <exception>

Aggregates::Aggregates() {}

Aggregates::Aggregates(const std::vector<Aggregate>& aggregates)
{
	this->aggregates = aggregates;
}

void Aggregates::print(const Table& table) const
{
	for (std::size_t i = 0; i < aggregates.size(); ++i)
	{
		if (aggregates[i].type == "COUNT")
		{
			std::cout << table.count(aggregates[i].col);
		}
		else if (aggregates[i].type == "MIN")
		{
			std::cout << table.min(aggregates[i].col);
		}
		else if (aggregates[i].type == "MAX")
		{
			std::cout << table.max(aggregates[i].col);
		}
		else if (aggregates[i].type == "AVG")
		{
			std::cout << table.avg(aggregates[i].col);
		}
		else if (aggregates[i].type == "SUM")
		{
			std::cout << table.sum(aggregates[i].col);
		}
		else
		{
			throw std::runtime_error("How did I print out ?"); // this must be unreachable, but just in case...
		}

		if (i != aggregates.size() - 1)
		{
			std::cout << ", ";
		}
	}
	std::cout << std::endl;
	std::cout << "1 row selected." << std::endl;
}

QueryArguments* Aggregates::clone() const
{
	return new Aggregates(*this);
}

std::istream& operator>>(std::istream& istr, Aggregates*& agg)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	if (token.type != Tokenizer::KEYWORD)
	{
		agg = nullptr;
		return istr;
	}

	agg = new Aggregates();

	while (token.type == Tokenizer::KEYWORD &&
		(token.value == "MIN" || token.value == "MAX" || token.value == "AVG" || token.value == "SUM" || token.value == "COUNT"))
	{
		Aggregate toPush;
		try
		{
			istr >> toPush;
		}
		catch (std::exception e)
		{
			delete agg;
			agg = nullptr;

			throw e;

			return istr;
		}
		agg->aggregates.push_back(toPush);
		tokenizer.getNextToken();

		token = tokenizer.peek();
		if (token.value == ",")
		{
			tokenizer.getNextToken();

			token = tokenizer.peek();
			if (token.type != Tokenizer::KEYWORD ||
				(token.value != "MIN" && token.value != "MAX" && token.value != "AVG" && token.value != "SUM" && token.value != "COUNT"))
			{
				delete agg;
				agg = nullptr;

				std::string message = "Unexpected token: " + token.value + ".\nExpected: AGGREGATE";
				throw std::invalid_argument(message);
			}
		}
	}
	return istr;
}
