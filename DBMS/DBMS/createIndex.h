#pragma once

#include "operation.h"
#include <string>

class CreateIndex : public Operation
{
private:
	std::string table;
	std::string col;
public:
	CreateIndex();
	CreateIndex(const std::string&, const std::string&);

	void eval() const;

	Operation* clone() const;

	friend std::istream& operator>>(std::istream&, CreateIndex*&);
};