# pragma once

#include "operation.h"
#include "columnDatatypePairs.h"
#include "primaryKey.h"

class CreateTable : public Operation
{
private:
	std::string table;
	ColumnDatatypePairs pairs;
	PrimaryKey* pk;

	void copy(const CreateTable&);
	void deallocate();
public:
	CreateTable();
	CreateTable(const std::string&, const ColumnDatatypePairs&, PrimaryKey*);
	CreateTable(const CreateTable&);
	CreateTable& operator=(const CreateTable&);

	void eval() const;

	Operation* clone() const;

	friend std::istream& operator>>(std::istream&, CreateTable*&);

	~CreateTable();
};
