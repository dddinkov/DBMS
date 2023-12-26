#pragma once

#include "operation.h"
#include "values.h"
#include <string>

class InsertInto : public Operation
{
private:
	std::string table;
	Values values;

public:
	InsertInto();
	InsertInto(const std::string&, const Values&);

	void eval() const;

	Operation* clone() const;

	friend std::istream& operator>>(std::istream&, InsertInto*&);
};