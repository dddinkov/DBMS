#pragma once

#include "operation.h"
#include "queryArguments.h"
#include "whereClauses.h"
#include "orderByClause.h"

class Query : public Operation
{
private:
	QueryArguments* queryArguments;
	std::string table;
	WhereClauses whereClauses;
	OrderByClause orderByClause;

	void copy(const Query&);
	void deallocate();
public:
	Query();
	Query(QueryArguments*, const std::string&, const WhereClauses&, const OrderByClause&);
	Query(const Query&);
	Query& operator=(const Query&);

	void eval() const;

	Operation* clone() const;

	friend std::istream& operator>>(std::istream&, Query*&);

	~Query();
};