#pragma once

#include "dataColumn.h"
#include <fstream>
#include <utility>
#include <unordered_map>

class DataRow {
private:
	std::unordered_map<DataColumn, std::string> record;
	void validate(const DataColumn&, const std::string&);
public:
	DataRow();
	void add(const DataColumn&, const std::string&);
	void update(const DataColumn&, const std::string&);

	std::string operator[](const DataColumn&) const;

	void serialize(std::fstream&);

	void deserialize(std::fstream&);

	friend std::ostream& operator<<(std::ostream&, const DataRow&);

	int compare(const DataColumn&, const DataRow&);
};
