#pragma once

#include <string>
#include <functional>
#include <fstream>
#include <iostream>

/// <summary>
/// Enumerates the datatypes we can use.
/// 
/// Types are String, Int, Double, Bool, and Null.
/// The type Null is used to identify an error. I do not allow nullable types in this project.
/// </summary>
enum Type {
	String,
	Int,
	Double,
	Bool,
	Null
};

struct DataColumn {
	/// <summary>
	/// A public field specifying the name of the column.
	/// </summary>
	std::string name;

	/// <summary>
	/// A public field specifying the type of the column's fields.
	/// </summary>
	Type type;
	
	/// <summary>
	/// A DataColumn operator== overload, to check wheter their names match.
	/// </summary>
	bool operator==(const DataColumn& other);

	/// <summary>
	/// A simple binary serialization method for DataColumn struct.
	/// 
	/// It takes a reference of type fstream and won't be closing it afterwards.
	/// </summary>
	void serialize(std::fstream& os);


	/// <summary>
	/// A simple binary deserialization method for DataColumn struct.
	/// 
	/// It takes a reference of type fstream and won't be closing it afterwards.
	/// </summary>
	void deserialize(std::fstream& istr);
};

namespace std
{
	/// <summary>
	/// Specialization of std::hash for the DataColumn struct.
	/// </summary>
	template<>
	struct hash<DataColumn>
	{
		/// <summary>
		/// Computes the hash value for a DataColumn object.
		/// </summary>
		size_t operator()(const DataColumn& col) const noexcept
		{
			return std::hash<std::string>()(col.name);
		}
	};
}

namespace std
{
	/// <summary>
	/// Specialization of std::equal_to for the DataColumn struct.
	/// </summary>
	template<>
	struct equal_to<DataColumn>
	{
		/// <summary>
		/// Checks whether two DataColumn objects are equal.
		/// </summary>
		bool operator()(const DataColumn& rcol, const DataColumn& lcol) const
		{
			return rcol.name == lcol.name;
		}
	};
}