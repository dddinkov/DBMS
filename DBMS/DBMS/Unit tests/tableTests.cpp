#ifndef DOCTEST_CONFIG_IMPLEMENT_TABLE
#define DOCTEST_CONFIG_IMPLEMENT_TABLE
#endif
#include "../doctest.h"
#include "../table.h"


TEST_CASE("Table test")
{
	Table table("testTable");

	DataColumn column1;
	column1.name = "String column";
	column1.type = Type::String;

	DataColumn column2;
	column2.name = "Int column";
	column2.type = Type::Int;

	DataColumn column3;
	column3.name = "Double column";
	column3.type = Type::Double;

	DataColumn column4;
	column4.name = "Bool column";
	column4.type = Type::Bool;

	table.addColumn(column1);
	table.addColumn(column2);
	table.addColumn(column3);
	table.addColumn(column4);

	SUBCASE("Data Column tests")
	{
		// Checking for exception due to a duplicate column
		CHECK_THROWS(table.addColumn(column4));

		column4.type = Type::Null;

		// These errors should ignore the type
		CHECK_THROWS(table.addColumn(column4));

		column4.type = Type::Bool;
	}

	// We will use Int column as an ID (primary key)
	table.setPK(column2);

	DataRow row1;

	SUBCASE("Data Row tests")
	{
		// We will check the way rows handle incorrect values.
		CHECK_THROWS(row1.add(column1, "I am missing my qutes!"));

		CHECK_THROWS(row1.add(column2, "-4532.4"));

		CHECK_THROWS(row1.add(column3, "I am not even a number!"));

		CHECK_THROWS(row1.add(column4, "I am not a boolean value!"));

		// The row shall be empty so adding it to the table shouldn't be possible
		CHECK_THROWS(table.addRow(row1));
	}

	row1.add(column1, "\"I am a valid \"string\"!\"");
	row1.add(column2, "1");
	row1.add(column3, "23.04");
	row1.add(column4, "TRUE");

	table.addRow(row1);

	// Duplicate key
	CHECK_THROWS(table.addRow(row1));
	// Duplicate using insert
	CHECK_THROWS(table.insert({ "\"\"", "1", "0", "FALSE" }));

	table.insert({ "\"String literal\"", "2", "-0.5", "FALSE" });

	CHECK(table.size() == 2);

	SUBCASE("Aggregates tests")
	{
		// Count should work with all types
		CHECK_THROWS(table.count("Unknown column"));
		CHECK(table.size() == table.count("*"));

		// The rest (min, max, sum, avg) should work only with double and int
		CHECK_THROWS(table.max("Unknown column"));
		CHECK_THROWS(table.max("String column"));
		CHECK(table.max("Int column") == 2);

		CHECK_THROWS(table.min("Unknown column"));
		CHECK_THROWS(table.min("String column"));
		CHECK(table.min("Int column") == 1);

		CHECK_THROWS(table.sum("Unknown column"));
		CHECK_THROWS(table.sum("String column"));
		CHECK(table.sum("Int column") == 3);

		CHECK_THROWS(table.avg("String column"));
		CHECK_THROWS(table.avg("Unknown column"));
		CHECK(table.avg("Int column") == 1.5);
	}

	SUBCASE("Table print function tests - for exceptions")
	{
		CHECK_THROWS(table.print({ "Unknown column" }));
	}

	SUBCASE("Table update function tests")
	{
		// Updating primary key value that makes duplicates
		CHECK_THROWS(table.update({ "Int column" },
			{ "1" },
			"Int column",
			"=",
			"2"));

		CHECK_THROWS(table.update({ "Unknown column" },
			{ "blabla" },
			"Int column",
			"=",
			"2"));

		CHECK_THROWS(table.update({ "Int column" },
			{ "1" },
			"Unknown column",
			"=",
			"2"));

		CHECK_THROWS(table.update({ "Int column" },
			{ "4", "5" },
			"Int column",
			"=",
			"2"));

		CHECK_EQ(table.update({ "Double column" },
			{ "444444" },
			"Int column",
			"=",
			"1"),
			1);

		CHECK(table.max("Double column") == 444444);
	}

	SUBCASE("Table filterBy function tests")
	{
		CHECK_THROWS(table.filterBy("Unknown column", "=", "value"));

		Table temp = table.filterBy("Int column", "!=", "1");

		CHECK(temp.size() == 1);

		temp = table.filterBy("Int column", ">=", "1");

		CHECK(temp.size() == 2);

		temp = table.filterBy("Bool column", "<=", "FALSE");

		CHECK(temp.size() == 1);

		temp = table.filterBy("String column", "=", "\"Unfound string literal\"");

		CHECK(temp.size() == 0);

		temp = table.filterBy("Bool column", "<", "FALSE");

		CHECK(temp.size() == 0);

		temp = table.filterBy("Int column", ">", "1");

		CHECK(temp.size() == 1);
	}

	SUBCASE("Table orderBy function tests")
	{
		CHECK_THROWS(table.orderBy("Unknown column", true));
	}

	// Missing tests for read, write, operator<<(that's not used anywhere), createIndex
}