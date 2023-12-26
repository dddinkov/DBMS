#pragma once

#include <vector>
#include <string>
#include "dataColumn.h"
#include "dataRow.h"
#include <ostream>
#include <functional>

// A table is a set of rows and columns
class Table {
private:
	std::string name;
	std::vector<DataColumn> columns;
	std::vector<DataRow> rows;

	DataColumn primary_key;

	// Checks the column for duplicates (if it's worthy of the title "primary key").
	void check_key(const std::string&);
	DataColumn getCol(const std::string&) const;
public:
	Table();
	Table(const std::string&);

	// Gives the size of the rows.
	std::size_t size() const;

	void addColumn(const DataColumn&);
	void addRow(const DataRow&);
	void setPK(const DataColumn&);

	// Inserts given values in the order of columns from user input of CREATE TABLE operation.
	void insert(const std::vector<std::string>&);
	// Updates the corresponding columns with their corresponding values, based on a condition (<column> <operator> <value>).
	void update(const std::vector<std::string>&, const std::vector<std::string>&, const std::string&, const std::string&, const std::string&);

	// Sorting by a column in ascending order (true) or descending order (false).
	Table orderBy(const std::string&, const bool&) const;

	// Given <column> <operator> <value>, filter the rows, and return another table with them, this is a WHERE clause execution.
	Table filterBy(const std::string&, const std::string&, const std::string&);

	// Given list of identifiers, print the rows in the corresponding order (of columns).
	void print(const std::vector<std::string>&) const;

	// These serialize and deserialize the table, they are executed only on update, and insert operations.
	void save();
	void read();

	// Aggregate functions
	std::size_t count(const std::string&) const;
	double min(const std::string&) const;
	double max(const std::string&) const;
	double avg(const std::string&) const;
	double sum(const std::string&) const;

	friend std::ostream& operator<<(std::ostream&, const Table&);
};