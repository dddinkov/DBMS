#pragma once

#include <iostream>

class Operation
{
public:
	virtual void eval() const = 0;

	virtual Operation* clone() const = 0;

	friend std::istream& operator>>(std::istream&, Operation*&);

	virtual ~Operation();
};