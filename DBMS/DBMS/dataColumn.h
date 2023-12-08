#pragma once

#include <string>
#include <functional>

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