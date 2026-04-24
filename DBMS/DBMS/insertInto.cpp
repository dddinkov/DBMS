#include "insertInto.h"
#include "tokenizer.h"
#include "table.h"
#include <exception>
#include <iostream>

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

	try
	{
		table.insert(values.literals);

		table.save();

		std::cout << "Record inserted." << std::endl;
	}
	catch (std::exception e)
	{
		std::cout << e.what() << "\n";
		std::cout << "Record not inserted." << std::endl;
	}
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
		std::string message = "Unexpected token: " + token.value + ".\nExpected: INTO";
		throw std::invalid_argument(message);
	}


	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.type != Tokenizer::IDENTIFIER)
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: IDENTIFIER";
		throw std::invalid_argument(message);
	}

	insertInto = new InsertInto();
	insertInto->table = token.value;

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value != "(")
	{
		delete insertInto;
		insertInto = nullptr;

		std::string message = "Unexpected token: " + token.value + ".\nExpected: (";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	try
	{
		istr >> insertInto->values;
	}
	catch (std::exception e)
	{
		delete insertInto;
		insertInto = nullptr;

		throw e;
	}

	token = tokenizer.peek();

	if (token.value != ")")
	{
		delete insertInto;
		insertInto = nullptr;

		std::string message = "Unexpected token: " + token.value + ".\nExpected: )";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value != ";")
	{
		delete insertInto;
		insertInto = nullptr;

		std::string message = "Unexpected token: " + token.value + ".\nExpected: ;";
		throw std::invalid_argument(message);
	}

	return istr;
}