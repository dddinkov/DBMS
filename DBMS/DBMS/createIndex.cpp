#include "createIndex.h"
#include "tokenizer.h"
#include "table.h"
#include <exception>

CreateIndex::CreateIndex() {}

CreateIndex::CreateIndex(const std::string& table, const std::string& col)
{
	this->table = table;
	this->col = col;
}

void CreateIndex::eval() const
{
	Table table(this->table);
	table.createIndex(this->col);
	std::cout << "Index created." << std::endl;
}

Operation* CreateIndex::clone() const
{
	return new CreateIndex(*this);
}

std::istream& operator>>(std::istream& istr, CreateIndex*& createIndex)
{
	Tokenizer tokenizer(istr);
	typename Tokenizer::Token token = tokenizer.peek();

	createIndex = nullptr;

	if (token.value != "INDEX") // Create is already read from Create Table
	{
		return istr;
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value != "ON")
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: on.";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.type != Tokenizer::IDENTIFIER)
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: IDENTIFIER.";
		throw std::invalid_argument(message);
	}

	createIndex = new CreateIndex();
	createIndex->table = token.value;

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value != "(")
	{
		delete createIndex;
		createIndex = nullptr;

		std::string message = "Unexpected token: " + token.value + ".\nExpected: (.";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.type != Tokenizer::IDENTIFIER)
	{
		delete createIndex;
		createIndex = nullptr;

		std::string message = "Unexpected token: " + token.value + ".\nExpected: (.";
		throw std::invalid_argument(message);
	}

	createIndex->col = token.value;

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value != ")")
	{
		delete createIndex;
		createIndex = nullptr;

		std::string message = "Unexpected token: " + token.value + ".\nExpected: ).";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value != ";")
	{
		delete createIndex;
		createIndex = nullptr;

		std::string message = "Unexpected token: " + token.value + ".\nExpected: ;.";
		throw std::invalid_argument(message);
	}

	return istr;
}