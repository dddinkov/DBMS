#pragma once

#include "operation.h"
#include "columnDatatypePairs.h"
#include "primaryKey.h"

/// <summary>
/// Class CreateTable, inherits Operation.
/// 
/// Following the following grammar rule:
/// CREATE_TABLE = "CREATE" "TABLE" TABLE "(" COLUMN_DATATYPE_PAIRS ")" [PRIMARY_KEY] ";"
/// </summary>
class CreateTable : public Operation
{
private:
	/// <summary>
	/// The table identifier.
	/// </summary>
	std::string table;

	/// <summary>
	/// ColumnDatatypePairs field storing, column identifiers and datatypes.
	/// </summary>
	ColumnDatatypePairs pairs;

	/// <summary>
	/// An optional primary key placeholder.
	/// 
	/// nullptr = no primary key.
	/// </summary>
	PrimaryKey* pk;

	/// <summary>
	/// A deep copy function.
	/// </summary>
	/// <param name=""></param>
	void copy(const CreateTable&);

	/// <summary>
	/// A function to release dynamic memory.
	/// </summary>
	void deallocate();
public:
	/// <summary>
	/// A default constructor.
	/// </summary>
	CreateTable();
	/// <summary>
	/// A parameterized constructor.
	/// </summary>
	CreateTable(const std::string&, const ColumnDatatypePairs&, PrimaryKey*);
	/// <summary>
	/// A copy constructor.
	/// </summary>
	CreateTable(const CreateTable&);

	/// <summary>
	/// operator= overload.
	/// </summary>
	CreateTable& operator=(const CreateTable&);

	/// <summary>
	/// CreateTable evaluation function.
	/// </summary>
	void eval() const;

	/// <summary>
	/// A clone function.
	/// </summary>
	Operation* clone() const;

	/// <summary>
	/// operator>> overload for inputting a CreateTable operation.
	/// </summary>
	friend std::istream& operator>>(std::istream&, CreateTable*&);

	/// <summary>
	/// CreateTable destructor.
	/// </summary>
	~CreateTable();
};
