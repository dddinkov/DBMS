#include "createTable.h"
#include "tokenizer.h"
#include "table.h"
#include <exception>

void CreateTable::copy(const CreateTable& other)
{
	this->pairs = other.pairs;
	this->table = other.table;
	this->pk = new PrimaryKey(*other.pk);
}

void CreateTable::deallocate()
{
	if (this->pk != nullptr)
	{
		delete this->pk;
	}
}

CreateTable::CreateTable() : pk(nullptr) {}

CreateTable::CreateTable(const std::string& table, const ColumnDatatypePairs& pairs, PrimaryKey* pk)
{
	this->table = table;
	this->pairs = pairs;
	this->pk = pk;
}

CreateTable::CreateTable(const CreateTable& other)
{
	copy(other);
}

CreateTable& CreateTable::operator=(const CreateTable& other)
{
	if (this != &other)
	{
		delete pk;
		copy(other);
	}
	return *this;
}

void CreateTable::eval() const
{
	Table table(this->table);
	for (const std::pair<std::string, std::string>& pair : this->pairs.pairs)
	{
		DataColumn col;
		if (pair.second == "string")
		{
			col.type = Type::String;
		}
		else if (pair.second == "bool")
		{
			col.type = Type::Bool;
		}
		else if (pair.second == "int")
		{
			col.type = Type::Int;
		}
		else if (pair.second == "double")
		{
			col.type = Type::Double;
		}
		col.name = pair.first;

		table.addColumn(col);

		if (this->pk != nullptr && col.name == this->pk->col)
		{
			table.setPK(col);
		}
	}

	table.save();
	std::cout << "Saved!\n";
}

Operation* CreateTable::clone() const
{
	return new CreateTable(*this);
}

std::istream& operator>>(std::istream& istr, CreateTable*& createTable)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	createTable = nullptr;

	if (token.value != "CREATE")
	{
		return istr;
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();

	createTable = nullptr;

	if (token.value != "TABLE")
	{
		return istr;
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.type != Tokenizer::IDENTIFIER)
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: IDENTIFIER.";
		throw std::invalid_argument(message);
	}

	createTable = new CreateTable();
	createTable->table = token.value;

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value != "(")
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: (.";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	ColumnDatatypePairs pairs;
	istr >> pairs;
	createTable->pairs = pairs;

	token = tokenizer.peek();

	if (token.value != ")")
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: ).";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value == ";")
	{
		createTable->pk = nullptr;
		return istr;
	}

	PrimaryKey pk;

	istr >> pk;

	if (token.value != ";")
	{
		std::string message = "Unexpected token: " + token.value + ".\nExpected: ;.";
		throw std::invalid_argument(message);
	}

	createTable->pk = new PrimaryKey(pk);

	return istr;
}

CreateTable::~CreateTable()
{
	deallocate();
}