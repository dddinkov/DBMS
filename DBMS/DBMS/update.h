#pragma once 

#include "operation.h"
#include "assignOperations.h"
#include "whereClause.h"
#include <string>

class Update : public Operation
{
private:
	std::string table;
	AssignOperations operations;
	WhereClause whereClause;

public:
	Update();
	Update(const std::string&, const AssignOperations&, const WhereClause&);

	void eval() const;

	Operation* clone() const;

	friend std::istream& operator>>(std::istream&, Update*&);
};
