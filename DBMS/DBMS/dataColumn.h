#pragma once

#include <string>
#include <functional>
#include <fstream>
#include <iostream>

enum Type {
	String,
	Int,
	Double,
	Bool,
	Null
};

struct DataColumn {
	std::string name;
	Type type;

	bool operator==(const DataColumn& other)
	{
		return name == other.name;
	}

	void serialize(std::fstream& os)
	{
		std::size_t nameLength = name.size();
		os.write(reinterpret_cast<const char*>(&nameLength), sizeof(std::size_t));
		os.write(name.c_str(), nameLength);

		os.write(reinterpret_cast<const char*>(&type), sizeof(Type));
	}

	void deserialize(std::fstream& istr)
	{
		std::size_t nameLength;
		istr.read(reinterpret_cast<char*>(&nameLength), sizeof(std::size_t));

		char* buffer = new char[nameLength + 1];
		istr.read(buffer, nameLength);
		buffer[nameLength] = '\0';
		name = buffer;
		delete[] buffer;

		istr.read(reinterpret_cast<char*>(&type), sizeof(Type));
	}
};

template<>
struct std::hash<DataColumn>
{
	std::size_t operator()(const DataColumn& col) const noexcept
	{
		return std::hash<std::string>()(col.name);
	}
};

template<>
struct std::equal_to<DataColumn>
{
	bool operator()(const DataColumn& rcol, const DataColumn& lcol) const
	{
		return rcol.name == lcol.name && rcol.type == lcol.type;
	}
};