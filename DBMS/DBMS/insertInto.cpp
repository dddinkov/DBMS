#include "insertInto.h"
#include "tokenizer.h"
#include "table.h"
#include <exception>

InsertInto::InsertInto() {}

InsertInto::InsertInto(const std::string& table, const Values& values)
{
	this->table = table;
	this->values = values;
}

void InsertInto::eval() const
{
	Table table(this->table);
	table.read();

	table.insert(values.literals);

	table.save();

	std::cout << "Values inserted successfully." << std::endl;
}

Operation* InsertInto::clone() const
{
	return new InsertInto(*this);
}

std::istream& operator>>(std::istream& istr, InsertInto*& insertInto)
{
	Tokenizer tokenizer(istr);
	typename Tokenizer::Token token = tokenizer.peek();
	insertInto = nullptr;

	if (token.value != "INSERT")
	{
		return istr;
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value != "INTO")
	{
		std::string message = "Undexpected token: " + token.value + ".\nExpected: INTO";
		throw std::invalid_argument(message);
	}


	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.type != Tokenizer::IDENTIFIER)
	{
		std::string message = "Undexpected token: " + token.value + ".\nExpected: IDENTIFIER";
		throw std::invalid_argument(message);
	}

	insertInto = new InsertInto();
	insertInto->table = token.value;

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value != "(")
	{
		std::string message = "Undexpected token: " + token.value + ".\nExpected: (";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	istr >> insertInto->values;

	token = tokenizer.peek();

	if (token.value != ")")
	{
		std::string message = "Undexpected token: " + token.value + ".\nExpected: )";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value != ";")
	{
		std::string message = "Undexpected token: " + token.value + ".\nExpected: ;";
		throw std::invalid_argument(message);
	}

	return istr;
}