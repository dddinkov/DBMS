#pragma once

#include "operation.h"
#include "queryArguments.h"
#include "whereClauses.h"
#include "orderByClause.h"

/// <summary>
/// Class Query, inherits from Operation.
/// 
/// Following the following rule from the grammar:
/// QUERY = "SELECT" QUERY_ARGUMENTS "FROM" TABLE [WHERE_CLAUSES] [ORDER_BY_CLAUSE] ";"
/// </summary>
class Query : public Operation
{
private:
	/// <summary>
	/// A dynamic field for query arguments - either column identifiers or a set of aggregate functions.
	/// </summary>
	QueryArguments* queryArguments;

	/// <summary>
	/// The table identifier.
	/// </summary>
	std::string table;

	/// <summary>
	/// Any optional where clauses, could 0, could be more.
	/// </summary>
	WhereClauses whereClauses;

	/// <summary>
	/// An oprional order by clause.
	/// </summary>
	OrderByClause orderByClause;

	/// <summary>
	/// A deep copy function.
	/// </summary>
	void copy(const Query&);

	/// <summary>
	/// A function to release dynamic memory.
	/// </summary>
	void deallocate();
public:
	/// <summary>
	/// A default constructor.
	/// </summary>
	Query();

	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	Query(QueryArguments*, const std::string&, const WhereClauses&, const OrderByClause&);
	
	/// <summary>
	/// A copy constructor.
	/// </summary>
	Query(const Query&);

	/// <summary>
	/// operator= overload.
	/// </summary>
	Query& operator=(const Query&);

	/// <summary>
	/// Query evaluation function.
	/// </summary>
	void eval() const;

	/// <summary>
	/// A clone function.
	/// </summary>
	Operation* clone() const;

	/// <summary>
	/// operator>> overload for inputting a Query operation.
	/// </summary>
	friend std::istream& operator>>(std::istream&, Query*&);

	/// <summary>
	/// Query destructor.
	/// </summary>
	~Query();
};