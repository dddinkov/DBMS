#pragma once

#include <vector>
#include <string>
#include "dataColumn.h"
#include "dataRow.h"
#include <ostream>
#include <functional>

class Table {
private:
	std::vector<DataColumn> columns;
	std::vector<DataRow> rows;

	DataColumn primary_key;

	void check_key(const std::string&);
public:
	Table();

	void addColumn(const DataColumn&);
	void addRow(const DataRow&);
	void setPK(const DataColumn&);

	Table orderBy(const std::vector<DataColumn>&, const std::vector<bool>&) const;

	Table filterBy(const std::vector<DataColumn>&, const std::vector<std::function<bool(const DataColumn&, const DataRow&)>>);

	friend std::ostream& operator<<(std::ostream&, const Table&);
};