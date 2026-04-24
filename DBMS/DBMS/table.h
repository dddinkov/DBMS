#pragma once

#include <vector>
#include <string>
#include "dataColumn.h"
#include "dataRow.h"
#include <ostream>
#include <functional>

/// <summary>
/// Class table represents a set of DataColumns and DataRows
/// </summary>
class Table {
private:
	/// <summary>
	/// A field to store the table's name.
	/// 
	/// Anonymous table may have the name "".
	/// </summary>
	std::string name;

	/// <summary>
	/// A field to store the set of DataColumns.
	/// </summary>
	std::vector<DataColumn> columns;

	/// <summary>
	/// A field to store the set of DataRows.
	/// </summary>
	std::vector<DataRow> rows;

	/// <summary>
	/// A field to store the primary key.
	/// 
	/// If the table doesn't have a primary key, it's type will be set to Null to indicate it.
	/// </summary>
	DataColumn primary_key;

	/// <summary>
	/// A function that checks the primary key for duplicates.
	/// 
	/// Throws an error if it finds any
	/// </summary>
	void check_key(const std::string&);

	/// <summary>
	/// A function that iterates through the table's columns, to find a DataColumn with the given name.
	/// 
	/// If such DataColumn doesn't exist, it returns a DataColumn with type Null to indicate this.
	/// </summary>
	DataColumn getCol(const std::string&) const;
public:
	/// <summary>
	/// A default constructor.
	/// 
	/// For anonymous tables.
	/// </summary>
	Table();

	/// <summary>
	/// A constructor with a single parameter for the table's name.
	/// </summary>
	Table(const std::string&);

	/// <summary>
	/// A getter for the size of the rows.
	/// </summary>
	/// <returns>The amount of rows in the table.</returns>
	std::size_t size() const;

	/// <summary>
	/// Adds the given DataColumn to the table.
	/// 
	/// If a column with the same name exists it will throw an error.
	/// </summary>
	void addColumn(const DataColumn&);

	/// <summary>
	/// Adds the given DataRow to the table.
	/// 
	/// If it breaks the uniqueness of the primary key of the table, it throws exception.
	/// </summary>
	void addRow(const DataRow&);

	/// <summary>
	/// A setter for the primary key of the table
	/// </summary>
	void setPK(const DataColumn&);

	/// <summary>
	/// Inserts given values in the order of columns from user input of CREATE TABLE operation.
	/// </summary>
	void insert(const std::vector<std::string>&);

	// Updates the corresponding columns with their corresponding values, based on a condition (<column> <operator> <value>).
	// Also returns the amount of affected rows.

	/// <summary>
	/// Updates the corresponding columns with their corresponding values, based on a condition (<column> <operator> <value>).
	/// </summary>
	/// <param name="">The columns we will be updating.</param>
	/// <param name="">The values to be replaced on those columns.</param>
	/// <param name="">column</param>
	/// <param name="">operator</param>
	/// <param name="">value</param>
	/// <returns>The amount of affected rows.</returns>
	std::size_t update(const std::vector<std::string>&, const std::vector<std::string>&, const std::string&, const std::string&, const std::string&);

	/// <summary>
	/// Sorting by a column in ascending order (true) or descending order (false).
	/// 
	/// An index may be used, if the user created any.
	/// </summary>
	/// <returns>The sorted table</returns>
	Table orderBy(const std::string&, const bool&) const;

	/// <summary>
	/// Given <column> <operator> <value>, filter the rows, and return another table with them, this is a WHERE clause execution.
	/// </summary>
	/// <param name="">column</param>
	/// <param name="">operator</param>
	/// <param name="">value</param>
	/// <returns>The filtered table.</returns>
	Table filterBy(const std::string&, const std::string&, const std::string&) const;

	/// <summary>
	/// Given list of identifiers, print the rows in the corresponding order (of columns).
	/// </summary>
	void print(const std::vector<std::string>&) const;

	/// <summary>
	/// A serializing function, to store table in a binary file with all it's data.
	/// 
	/// The table will be saved in name.bin.
	/// </summary>
	void save();

	/// <summary>
	/// A deserializing function, to read a table from a binary file.
	/// 
	/// The table will be read from name.bin.
	/// </summary>
	void read();

	/// <summary>
	/// An aggregate function - COUNT, accepts an identifier (DataColumn's name).
	/// 
	/// The * identifier is valid for this function as well.
	/// Throws exception if the column doesn't exist.
	/// </summary>
	/// <returns>Returns the amount of rows in the table.</returns>
	std::size_t count(const std::string&) const;

	/// <summary>
	/// An aggregate function - MIN, accepts an identifier (DataColumn's name).
	/// 
	/// Throws exception if the column doesn't exist.
	/// </summary>
	/// <returns>Returns the smallest element from the given column.</returns>
	double min(const std::string&) const;

	/// <summary>
	/// An aggregate function - MAX, accepts an identifier (DataColumn's name).
	/// 
	/// Throws exception if the column doesn't exist.
	/// </summary>
	/// <returns>Returns the biggest element from the given column.</returns>
	double max(const std::string&) const;

	/// <summary>
	/// An aggregate function - AVG, accepts an identifier (DataColumn's name).
	/// 
	/// Throws exception if the column doesn't exist, or it's type is not Double or Int.
	/// </summary>
	/// <returns>Returns the average value of all fields in the given column.</returns>
	double avg(const std::string&) const;

	/// <summary>
	/// An aggregate function - SUM, accepts an identifier (DataColumn's name).
	/// 
	/// Throws exception if the column doesn't exist, or it's type is not Double or Int.
	/// </summary>
	/// <returns>Returns the sum of all fields in the given column.</returns>
	double sum(const std::string&) const;

	/// <summary>
	/// Creates a BTree (Index tree) on the given column identifier (DataColumn name) and saves it in a separate file.
	/// 
	/// The file in which the index tree is stored is labeled name_columnName.bin
	/// 
	/// Throws exception if column doesn't exist.
	/// </summary>
	void createIndex(const std::string&) const;

	/// <summary>
	/// A friendly operator<< overload to output a table.
	/// </summary>
	friend std::ostream& operator<<(std::ostream&, const Table&);
};