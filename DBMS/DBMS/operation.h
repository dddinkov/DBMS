#pragma once

#include <iostream>

/// <summary>
/// Abstract class Operation.
/// 
/// Follows the following rule from the grammar:
/// OPERATION = QUERY | CREATE_TABLE | INSERT_INTO | UPDATE | CREATE_INDEX
/// </summary>
class Operation
{
public:
	/// <summary>
	/// A pure virtual function to evaluate the operation.
	/// </summary>
	virtual void eval() const = 0;

	/// <summary>
	/// A pure virtual clone function.
	/// </summary>
	/// <returns></returns>
	virtual Operation* clone() const = 0;

	/// <summary>
	/// A friendly operator>> overload to input an Operation.
	/// </summary>
	friend std::istream& operator>>(std::istream&, Operation*&);

	/// <summary>
	/// A default destructor.
	/// </summary>
	virtual ~Operation();
};