// DBMS.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include "table.h"

int main()
{
    Table table;
    DataColumn col1 = {"Name", Type::String};
    table.setPK(col1);
    table.addColumn(col1);
    DataColumn col2 = { "Age", Type::Int};
    table.addColumn(col2);
    DataRow row;
    row.add(col1,"Tate");
    row.add(col2, "18");
    table.addRow(row);
    row.update(col1, "George");
    row.update(col2, "23");
    table.addRow(row);
    row.update(col1, "Samantha");
    row.update(col2, "23");
    table.addRow(row);
    row.update(col1, "Bertha");
    row.update(col2, "23");
    table.addRow(row);
    row.update(col1, "Henry");
    row.update(col2, "28");
    table.addRow(row);
    std::cout << table;

    std::vector<DataColumn> columns;
    columns.push_back(col2);
    columns.push_back(col1);

    std::vector<bool> bools;
    bools.push_back(false);
    bools.push_back(true);
    table = table.orderBy(columns, bools);

    std::cout << table;
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
