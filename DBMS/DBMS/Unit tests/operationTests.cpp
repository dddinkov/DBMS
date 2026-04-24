#ifndef DOCTEST_CONFIG_IMPLEMENT_OPERATION
#define DOCTEST_CONFIG_IMPLEMENT_OPERATION
#endif
#include "../doctest.h"
#include "../operation.h"
#include "../query.h"
#include "../createTable.h"
#include "../createIndex.h"
#include "../update.h"
#include "../insertInto.h"
#include "../columns.h"
#include "../aggregates.h"
#include "../queryArguments.h"
#include <sstream>

// Every single class will be a separate test - only testing main classes: Create Table, Update, Insert Into, Create Index and Query (Select))
TEST_CASE("Query (SELECT statement) class tests")
{
	SUBCASE("Query Arguments class tests")
	{
		SUBCASE("Column arguments tests")
		{
			std::stringstream queryArgumentsInput1("Col1, Col2, Col3, Col4, just_a_bunch_of_valid_identifiers_to_check_if_it_works_correctly");
			std::stringstream queryArgumentsInput2("Col1, 2Col, error");
			std::stringstream queryArgumentsInput3("Col1, MIN(Col1), error");

			Columns* columnArguments1;

			queryArgumentsInput1 >> columnArguments1;

			CHECK_NE(columnArguments1, nullptr);

			delete columnArguments1;

			Columns* columnArguments2;

			CHECK_THROWS(queryArgumentsInput2 >> columnArguments2);

			CHECK_EQ(columnArguments2, nullptr);

			Columns* columnArguments3;

			CHECK_THROWS(queryArgumentsInput3 >> columnArguments3);

			CHECK_EQ(columnArguments3, nullptr);
		}

		SUBCASE("Aggregates arguments tests")
		{
			std::stringstream queryArgumentsInput1("SUM(Col2), COUNT(*)");
			std::stringstream queryArgumentsInput2("AVG(1Col), MIN(Col4)");
			std::stringstream queryArgumentsInput3("MAX(Col1), Col3");

			Aggregates* aggregatesArguments1;

			queryArgumentsInput1 >> aggregatesArguments1;

			CHECK_NE(aggregatesArguments1, nullptr);

			delete aggregatesArguments1;

			Aggregates* aggregatesArguments2;

			CHECK_THROWS(queryArgumentsInput2 >> aggregatesArguments2);

			CHECK_EQ(aggregatesArguments2, nullptr);

			Aggregates* aggregatesArguments3;

			CHECK_THROWS(queryArgumentsInput3 >> aggregatesArguments3);

			CHECK_EQ(aggregatesArguments3, nullptr);
		}

		std::stringstream queryArgumentsInvalidInput("Col1, Col2, MAX(Col3)");

		QueryArguments* queryArguments;

		CHECK_THROWS(queryArgumentsInvalidInput >> queryArguments);

		CHECK_EQ(queryArguments, nullptr);

		std::stringstream queryArgumentsValidInput1("Col1, Col2, Col3");

		QueryArguments* queryArguments1;

		queryArgumentsValidInput1 >> queryArguments1;

		CHECK_NE(queryArguments1, nullptr);

		std::stringstream queryArgumentsValidInput2("MAX(Col1), MIN(Col2), COUNT(*)");

		QueryArguments* queryArguments2;

		queryArgumentsValidInput2 >> queryArguments2;

		CHECK_NE(queryArguments2, nullptr);
	}

	// Where clauses may have 0 or more where clauses
	SUBCASE("Where clauses tests")
	{
		SUBCASE("Where clause tests")
		{
			SUBCASE("Condition tests")
			{
				std::stringstream conditionInput1("col1 < 40");

				Condition condition1;

				conditionInput1 >> condition1;

				CHECK_EQ(condition1.col, "col1");
				CHECK_EQ(condition1.op, "<");
				CHECK_EQ(condition1.value, "40");

				std::stringstream conditionInput2("col2 != \"String\"");

				Condition condition2;

				conditionInput2 >> condition2;

				CHECK_EQ(condition2.col, "col2");
				CHECK_EQ(condition2.op, "!=");
				CHECK_EQ(condition2.value, "\"String\"");

				std::stringstream conditionInput3("col2 not \"String\"");

				Condition condition3;

				CHECK_THROWS(conditionInput3 >> condition3);
			}

			std::stringstream whereClauseInput1("WHERE col1 >= 1");

			WhereClause whereClause1;

			whereClauseInput1 >> whereClause1;

			CHECK_EQ(whereClause1.cond.col, "col1");
			CHECK_EQ(whereClause1.cond.op, ">=");
			CHECK_EQ(whereClause1.cond.value, "1");

			std::stringstream whereClauseInput2("There_is_no_where_here col2 >= 1");

			WhereClause whereClause2;

			CHECK_THROWS(whereClauseInput2 >> whereClause2);
		}

		std::stringstream whereClausesInput1("");

		WhereClauses whereClauses1;

		whereClausesInput1 >> whereClauses1;

		CHECK_EQ(whereClauses1.whereClauses.size(), 0);

		std::stringstream whereClausesInput2("WHERE col1 < 6 WHERE col2 <= 11 WHERE col3 = FALSE");

		WhereClauses whereClauses2;

		whereClausesInput2 >> whereClauses2;

		CHECK_EQ(whereClauses2.whereClauses.size(), 3);

		Condition& cond0 = whereClauses2.whereClauses[0].cond;

		CHECK_EQ(cond0.col, "col1");
		CHECK_EQ(cond0.op, "<");
		CHECK_EQ(cond0.value, "6");

		Condition& cond1 = whereClauses2.whereClauses[1].cond;

		CHECK_EQ(cond1.col, "col2");
		CHECK_EQ(cond1.op, "<=");
		CHECK_EQ(cond1.value, "11");

		Condition& cond2 = whereClauses2.whereClauses[2].cond;

		CHECK_EQ(cond2.col, "col3");
		CHECK_EQ(cond2.op, "=");
		CHECK_EQ(cond2.value, "FALSE");
	}

	SUBCASE("Order By tests")
	{
		std::stringstream orderByInput1("ORDER BY col1 ASC");

		OrderByClause orderBy1;

		orderByInput1 >> orderBy1;

		CHECK_EQ(orderBy1.col, "col1");
		CHECK(orderBy1.asc);

		std::stringstream orderByInput2("ORDER BY col2 DESC");

		OrderByClause orderBy2;

		orderByInput2 >> orderBy2;

		CHECK_EQ(orderBy2.col, "col2");
		CHECK_FALSE(orderBy2.asc);

		std::stringstream orderByInput3("ORDER BY col3");

		OrderByClause orderBy3;

		CHECK_THROWS(orderByInput3 >> orderBy3);
	}

	std::stringstream queryInput1("SELECT * FROM table1;");

	Query* query1;

	CHECK_NOTHROW(queryInput1 >> query1);

	delete query1;

	std::stringstream queryInput2("SELECT AVG(col1) FROM table1 WHERE col2 = \"\";");

	Query* query2;

	CHECK_NOTHROW(queryInput2 >> query2);

	delete query2;

	std::stringstream queryInput3("SELECT col1, col2 FROM table1 ORDER BY col3 ASC;");

	Query* query3;

	CHECK_NOTHROW(queryInput3 >> query3);

	delete query3;

	std::stringstream queryInput4("SELECT col1, col2 FROM table1 WHERE col3 >= 4 WHERE col3 <= 10 ORDER BY col4 DESC;");

	Query* query4;

	CHECK_NOTHROW(queryInput4 >> query4);

	delete query4;
}

TEST_CASE("CreateTable class tests")
{
	SUBCASE("ColumnDatatypePairs tests")
	{
		std::stringstream columnDatatypePairsInput1("col1 int, col2 string, col3 bool, col4 double");

		ColumnDatatypePairs columnDatatypePairs1;

		columnDatatypePairsInput1 >> columnDatatypePairs1;

		CHECK(columnDatatypePairs1.pairs.size() == 4);

		std::pair<std::string, std::string> pair0 = columnDatatypePairs1.pairs[0];

		CHECK_EQ(pair0.first, "col1");
		CHECK_EQ(pair0.second, "int");

		std::pair<std::string, std::string> pair1 = columnDatatypePairs1.pairs[1];

		CHECK_EQ(pair1.first, "col2");
		CHECK_EQ(pair1.second, "string");

		std::pair<std::string, std::string> pair2 = columnDatatypePairs1.pairs[2];

		CHECK_EQ(pair2.first, "col3");
		CHECK_EQ(pair2.second, "bool");

		std::pair<std::string, std::string> pair3 = columnDatatypePairs1.pairs[3];

		CHECK_EQ(pair3.first, "col4");
		CHECK_EQ(pair3.second, "double");

		std::stringstream columnDatatypePairsInput2("int col1, double col2");

		ColumnDatatypePairs columnDatatypePairs2;

		CHECK_THROWS(columnDatatypePairsInput2 >> columnDatatypePairs2);
	}

	SUBCASE("PrimaryKey tests")
	{
		std::stringstream pkInput1("PRIMARY KEY Col1");

		PrimaryKey pk1;

		pkInput1 >> pk1;

		CHECK_EQ(pk1.col, "Col1");

		std::stringstream pkInput2("PRIMARY Col2");

		PrimaryKey pk2;

		CHECK_THROWS(pkInput2 >> pk2);
	}

	std::stringstream input1("CREATE TABLE table (Col1 int) PRIMARY KEY Col1;");

	CreateTable* createTable1;

	CHECK_NOTHROW(input1 >> createTable1);

	delete createTable1;

	std::stringstream input2("CREATE TABLE table;"); // it's missing columns

	CreateTable* createTable2;

	CHECK_THROWS(input2 >> createTable2);

	CHECK_EQ(createTable2, nullptr);
}

TEST_CASE("InsertInto class tests")
{
	SUBCASE("Values tests")
	{
		std::stringstream valuesInput1("\"string value\", 123, -0.663, TRUE");

		Values values1;

		valuesInput1 >> values1;

		std::vector<std::string> expectedValues1 = { "\"string value\"", "123", "-0.663", "TRUE" };

		CHECK_EQ(values1.literals.size(), 4);

		for (std::size_t i = 0; i < 4; ++i)
		{
			CHECK_EQ(expectedValues1[i], values1.literals[i]);
		}

		std::stringstream valuesInput2("");

		Values values2;

		valuesInput2 >> values2;

		CHECK_EQ(values2.literals.size(), 0);
	}

	std::stringstream insertIntoInput1("INSERT INTO table1 (\"\", 1, TRUE, 2.33);");

	InsertInto* insertInto1;

	insertIntoInput1 >> insertInto1;

	CHECK_NE(insertInto1, nullptr);

	delete insertInto1;

	std::stringstream insertIntoInput2("INSERT table1 (\"\", 1, TRUE, 2.33);");

	InsertInto* insertInto2;

	CHECK_THROWS(insertIntoInput2 >> insertInto2);

	CHECK_EQ(insertInto2, nullptr);
}

TEST_CASE("Update class tests")
{
	SUBCASE("AssignOperations tests")
	{
		std::stringstream assignOperationsInput1("col1 = 1, col2=\"\", col3 =0.3, col4=FALSE");

		AssignOperations assignOperations1;

		assignOperationsInput1 >> assignOperations1;

		CHECK_EQ(assignOperations1.conds.size(), 4);

		std::vector<std::string> expectedColumns1 = {"col1", "col2", "col3", "col4"};
		std::vector<std::string> expectedOperators1(4,"=");
		std::vector<std::string> expectedValues1 = {"1", "\"\"", "0.3", "FALSE"};

		for (std::size_t i = 0; i < 4; ++i)
		{
			CHECK_EQ(expectedColumns1[i], assignOperations1.conds[i].col);
			CHECK_EQ(expectedOperators1[i], assignOperations1.conds[i].op);
			CHECK_EQ(expectedValues1[i], assignOperations1.conds[i].value);
		}

		std::stringstream assignOperationsInput2("col1!=4");

		AssignOperations assignOperations2;

		CHECK_THROWS(assignOperationsInput2 >> assignOperations2);
	}

	std::stringstream updateInput1("UPDATE table1 SET col1=1, col2=TRUE, col3=4.2 WHERE col1 >= 3;");

	Update* update1;

	updateInput1 >> update1;

	CHECK_NE(update1, nullptr);

	delete update1;

	std::stringstream updateInput2("UPDATE table1 SET col1=1;");

	Update* update2;

	CHECK_THROWS(updateInput2 >> update2);

	CHECK_EQ(update2, nullptr);
}

TEST_CASE("CreateIndex class tests")
{
	// CREATE should be read by operation so we skip it here
	std::stringstream createIndexInput1("INDEX ON table1 (col1);");
	CreateIndex* createIndex1;

	CHECK_NOTHROW(createIndexInput1 >> createIndex1);

	CHECK_NE(createIndex1, nullptr);

	std::stringstream createIndexInput2("INDEX ON table1 col1;");
	CreateIndex* createIndex2;

	CHECK_THROWS(createIndexInput2 >> createIndex2);

	CHECK_EQ(createIndex2, nullptr);
}

TEST_CASE("Operation class tests")
{
	std::stringstream operationInput1("");

	Operation* operation1;

	CHECK_THROWS(operationInput1 >> operation1);

	CHECK_EQ(operation1, nullptr);

	SUBCASE("Create Table")
	{
		std::stringstream input("CREATE TABLE testTable (col1 int, col2 string, col3 bool) PRIMARY KEY col1;");

		Operation* op;

		CHECK_NOTHROW(input >> op);

		CHECK_NOTHROW(op->eval());

		delete op;
	}

	SUBCASE("Insert Into")
	{
		std::stringstream input1("INSERT INTO testTable (1, \"Adam\", TRUE);");
		std::stringstream input2("INSERT INTO testTable (2, \"Eve\", TRUE);");
		std::stringstream input3("INSERT INTO testTable (3, \"George\", TRUE);");
		std::stringstream input4("INSERT INTO testTable (4, \"Coco\", TRUE);");
		std::stringstream input5("INSERT INTO testTable (5, \"Koko\", TRUE);");

		Operation* op1, * op2, * op3, * op4, * op5;

		CHECK_NOTHROW(input1 >> op1);
		CHECK_NOTHROW(input2 >> op2);
		CHECK_NOTHROW(input3 >> op3);
		CHECK_NOTHROW(input4 >> op4);
		CHECK_NOTHROW(input5 >> op5);

		CHECK_NOTHROW(op1->eval());
		CHECK_NOTHROW(op2->eval());
		CHECK_NOTHROW(op3->eval());
		CHECK_NOTHROW(op4->eval());
		CHECK_NOTHROW(op5->eval());

		delete op1;
		delete op2;
		delete op3;
		delete op4;
		delete op5;
	}

	SUBCASE("Update")
	{
		std::stringstream input("UPDATE testTable SET col3 = FALSE WHERE col2 = \"Eve\";");

		Operation* op;

		CHECK_NOTHROW(input >> op);

		CHECK_NOTHROW(op->eval());

		delete op;
	}

	SUBCASE("Create Index")
	{
		std::stringstream input("CREATE INDEX ON testTable (col2);");

		Operation* op;

		CHECK_NOTHROW(input >> op);

		CHECK_NOTHROW(op->eval());

		delete op;
	}

	SUBCASE("Query")
	{
		std::stringstream input("SELECT * FROM testTable ORDER BY col2 DESC;");

		Operation* op;

		CHECK_NOTHROW(input >> op);

		CHECK_NOTHROW(op->eval());

		delete op;
	}
}