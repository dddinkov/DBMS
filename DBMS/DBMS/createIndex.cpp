#include "createIndex.h"
#include "tokenizer.h"
#include "table.h"
#include <exception>

CreateIndex::CreateIndex() {}

CreateIndex::CreateIndex(const std::string& table, const std::string& col)
{
	this->table = table;
	this->col = col;
}

void CreateIndex::eval() const
{
	// to do
}

Operation* CreateIndex::clone() const
{
	return new CreateIndex(*this);
}

std::istream& operator>>(std::istream& istr, CreateIndex*& createIndex)
{
	// to do
	return istr;
}