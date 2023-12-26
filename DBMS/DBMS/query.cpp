#include "query.h"
#include "tokenizer.h"
#include "table.h"
#include <exception>

void Query::copy(const Query& other)
{
	this->table = other.table;
	this->queryArguments = other.queryArguments->clone();
	this->whereClauses = other.whereClauses;
	this->orderByClause = other.orderByClause;
}

void Query::deallocate()
{
	if (queryArguments != nullptr)
	{
		delete queryArguments;
	}
}

Query::Query() : queryArguments(nullptr) {}

Query::Query(const Query& other)
{
	copy(other);
}

Query& Query::operator=(const Query& other)
{
	if (this != &other)
	{
		deallocate();
		copy(other);
	}
	return *this;
}

Query::Query(QueryArguments* queryArguments, const std::string& table, const WhereClauses& whereClauses, const OrderByClause& orderByClause)
{
	this->queryArguments = queryArguments;
	this->table = table;
	this->whereClauses = whereClauses;
	this->orderByClause = orderByClause;
}

void Query::eval() const
{
	Table table(this->table);
	table.read();

	for (const WhereClause& clause : this->whereClauses.whereClauses)
	{
		table = table.filterBy(clause.cond.col, clause.cond.op, clause.cond.value);
	}

	if (this->orderByClause.col != "") // if there is orderByClause
	{
		table = table.orderBy(this->orderByClause.col, this->orderByClause.asc);
	}

	queryArguments->print(table);
}

Operation* Query::clone() const
{
	return new Query(*this);
}

Query::~Query()
{
	deallocate();
}

std::istream& operator>>(std::istream& istr, Query*& query)
{
	Tokenizer tokenizer(istr);

	typename Tokenizer::Token token = tokenizer.peek();
	if (token.value == "SELECT")
	{
		tokenizer.getNextToken();

		QueryArguments* queryArguments = nullptr;
		istr >> queryArguments;

		if (queryArguments == nullptr) // QueryArguments operator>> should throw exception here
		{
			// this block is unreachable
			query = nullptr;
			return istr;
		}

		token = tokenizer.peek();
		if (token.value == "FROM")
		{
			tokenizer.getNextToken();

			token = tokenizer.peek();
			if (token.type == Tokenizer::IDENTIFIER)
			{
				std::string table = token.value;
				tokenizer.getNextToken();

				query = new Query();
				query->table = table;
				query->queryArguments = queryArguments;
				istr >> query->whereClauses;
				istr >> query->orderByClause;

				token = tokenizer.peek();
				if (token.value != ";")
				{
					std::string message = "Unexpected token: " + token.value + ".\nExpected: ;";
					throw std::invalid_argument(message);
				}
				tokenizer.getNextToken();
				return istr;
			}
			else
			{
				std::string message = "Unexpected token: " + token.value + ".\nExpected: IDENTIFIER";
				throw std::invalid_argument(message);
			}
		}
		else
		{
			std::string message = "Unexpected token: " + token.value + ".\nExpected: FROM";
			throw std::invalid_argument(message);
		}
	}
	else
	{
		query = nullptr;
	}
	return istr;
}