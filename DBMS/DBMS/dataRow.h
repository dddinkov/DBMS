#pragma once

#include "dataColumn.h"
#include <fstream>
#include <utility>
#include <unordered_map>

/// <summary>
/// DataRow class to store a record in a table.
/// </summary>
class DataRow {
private:
	/// <summary>
	/// A private unordered_map field using keys of type DataColumn and values of type string.
	/// 
	/// Used to access the row's contents or modify them by a given column.
	/// </summary>
	std::unordered_map<DataColumn, std::string> record;

	/// <summary>
	/// A DataRow class private function to validate values, using a column's type for validation.
	/// Throws exceptions on a Null type DataColumn object, or invalid literals (the string object).
	/// 
	/// Example:
	/// If the DataColumn object is of type Bool we check whether the give string object is equal to or FALSE.
	/// </summary>
	void validate(const DataColumn&, const std::string&);
public:
	/// <summary>
	/// A default constructor.
	/// 
	/// Literally does nothing.
	/// </summary>
	DataRow();

	/// <summary>
	/// Adds a new field to the record, if it's valid.
	/// </summary>
	void add(const DataColumn&, const std::string&);

	/// <summary>
	/// Updates a field in record, if it's valid.
	/// </summary>
	void update(const DataColumn&, const std::string&);

	/// <summary>
	/// Operator[] overload for class DataRow to access record field's elements (readonly).
	/// </summary>
	std::string operator[](const DataColumn&) const;

	/// <summary>
	/// A simple binary serialization method for class DataRow.
	/// 
	/// It takes a reference of type fstream and won't be closing it afterwards.
	/// </summary>
	void serialize(std::fstream&);

	/// <summary>
	/// A simple binary deserialization method for class DataRow.
	/// 
	/// It takes a reference of type fstream and won't be closing it afterwards.
	/// </summary>
	void deserialize(std::fstream&);

	/// <summary>
	/// A friendly operator<< overload for outputting a DataRow.
	/// </summary>
	friend std::ostream& operator<<(std::ostream&, const DataRow&);

	/// <summary>
	/// A function to compare the given row with another, given a DataColumn object as a key.
	/// </summary>
	/// <returns>0 if the values are equal, 1 if this row's value > the other row's value, and -1 if this row's value < the other row's value</returns>
	int compare(const DataColumn&, const DataRow&);
};
