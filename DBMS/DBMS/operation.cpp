#include "operation.h"
#include "query.h"
#include "createTable.h"
#include "insertInto.h"
#include "update.h"
#include "createIndex.h"
#include <exception>

std::istream& operator>>(std::istream& istr, Operation*& oper)
{
	Query* query;
	istr >> query;
	if (query != nullptr)
	{
		oper = query;
		return istr;
	}

	CreateTable* cr;
	istr >> cr;
	if (cr != nullptr)
	{
		oper = cr;
		return istr;
	}

	InsertInto* insert;
	istr >> insert;
	if (insert != nullptr)
	{
		oper = insert;
		return istr;
	}

	Update* update;
	istr >> update;
	if (update != nullptr)
	{
		oper = update;
		return istr;
	}

	CreateIndex* ind;
	istr >> ind;
	if (ind == nullptr)
	{
		oper = ind;
		return istr;
	}

	oper = nullptr;
	throw std::exception("ERROR:Invalid command!");
	return istr;
}

Operation::~Operation() {}