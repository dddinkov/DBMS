#include "update.h"
#include "tokenizer.h"
#include "table.h"
#include <exception>

Update::Update() {}

Update::Update(const std::string& table, const AssignOperations& operations, const WhereClause& whereClause)
{
	this->table = table;
	this->operations = operations;
	this->whereClause = whereClause;
}

void Update::eval() const
{
	Table table(this->table);
	table.read();

	std::vector<std::string> cols, values;
	for (const Condition& cond : operations.conds)
	{
		cols.push_back(cond.col);
		values.push_back(cond.value);
	}

	std::size_t updatedRows = table.update(cols, values, whereClause.cond.col, whereClause.cond.op, whereClause.cond.value);

	(updatedRows == 1) ? std::cout << "1 row updated." << std::endl : std::cout << updatedRows << " rows updated." << std::endl;

	table.save();
}

Operation* Update::clone() const
{
	return new Update(*this);
}

std::istream& operator>>(std::istream& istr, Update*& update)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();

	update = nullptr;

	if (token.value != "UPDATE")
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

	update = new Update();
	update->table = token.value;

	tokenizer.getNextToken();

	token = tokenizer.peek();

	if (token.value != "SET")
	{
		delete update;
		update = nullptr;

		std::string message = "Unexpected token: " + token.value + ".\nExpected: SET.";
		throw std::invalid_argument(message);
	}

	tokenizer.getNextToken();

	try
	{
		istr >> update->operations;

		istr >> update->whereClause;
	}
	catch (std::exception e)
	{
		delete update;
		update = nullptr;

		throw e;
	}

	token = tokenizer.peek();

	if (token.value != ";")
	{
		delete update;
		update = nullptr;

		std::string message = "Unexpected token: " + token.value + ".\nExpected: ;.";
		throw std::invalid_argument(message);
	}

	return istr;
}
