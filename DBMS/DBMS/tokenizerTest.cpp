#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "doctest.h"
#include "tokenizer.h"

TEST_CASE("Tokenizer - keywords identification")
{
	std::istringstream input("SELECT UPDATE INSERT CREATE TABLE string MIN AVG");
	Tokenizer::Token token;

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "SELECT");

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "UPDATE");

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "INSERT");

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "CREATE");

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "TABLE");

	input >> token;

	CHECK(token.type == Tokenizer::DATATYPE);
	CHECK(token.value == "string");

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "MIN");

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "AVG");
}

TEST_CASE("Tokenizer - identifiers identification")
{
	std::istringstream input("_id2 __ columnName _1 ABC I_D_E_N_T_I_F_I_E_R _2_1_4_5_6 polpo");
	Tokenizer::Token token;

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "_id2");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "__");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "columnName");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "_1");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "ABC");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "I_D_E_N_T_I_F_I_E_R");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "_2_1_4_5_6");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "polpo");
}

TEST_CASE("Tokenizer - literals identification")
{
	std::istringstream input("\"That's a string literal\" 1245 23.64 False .95726 000005420 \"That's another \\\"string\\\" literal\" True -19.23 -10");
	Tokenizer::Token token;

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == "\"That's a string literal\"");

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == "1245");

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == "23.64");

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == "False");

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == ".95726");

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == "000005420");

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == "\"That's another \"string\" literal\"");

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == "True");

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == "-19.23");

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == "-10");
}

TEST_CASE("Tokenizer - punctuation identification")
{
	std::istringstream input(",;(,(););,;)");
	Tokenizer::Token token;

	input >> token;

	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == ",");

	input >> token;

	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == ";");

	input >> token;

	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == "(");

	input >> token;

	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == ",");
	input >> token;

	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == "(");
	input >> token;


	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == ")");
	input >> token;

	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == ";");
	input >> token;

	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == ")");
	input >> token;

	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == ";");
	input >> token;

	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == ",");
	input >> token;

	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == ";");
}

TEST_CASE("Tokenizer - operator identification")
{
	std::istringstream input("< >= = != > <=");
	Tokenizer::Token token;

	input >> token;

	CHECK(token.type == Tokenizer::OPERATOR);
	CHECK(token.value == "<");

	input >> token;

	CHECK(token.type == Tokenizer::OPERATOR);
	CHECK(token.value == ">=");

	input >> token;

	CHECK(token.type == Tokenizer::OPERATOR);
	CHECK(token.value == "=");

	input >> token;

	CHECK(token.type == Tokenizer::OPERATOR);
	CHECK(token.value == "!=");

	input >> token;

	CHECK(token.type == Tokenizer::OPERATOR);
	CHECK(token.value == ">");

	input >> token;

	CHECK(token.type == Tokenizer::OPERATOR);
	CHECK(token.value == "<=");
}

TEST_CASE("Tokenizer - general test")
{
	std::istringstream input("SELECT * FROM table1 WHERE col1=\"string1\" WHERE col2>=-5 ORDER BY col3;");
	Tokenizer::Token token;

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "SELECT");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "*");

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "FROM");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "table1");

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "WHERE");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "col1");

	input >> token;

	CHECK(token.type == Tokenizer::OPERATOR);
	CHECK(token.value == "=");

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == "\"string1\"");

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "WHERE");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "col2");

	input >> token;

	CHECK(token.type == Tokenizer::OPERATOR);
	CHECK(token.value == ">=");

	input >> token;

	CHECK(token.type == Tokenizer::LITERAL);
	CHECK(token.value == "-5");

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "ORDER");

	input >> token;

	CHECK(token.type == Tokenizer::KEYWORD);
	CHECK(token.value == "BY");

	input >> token;

	CHECK(token.type == Tokenizer::IDENTIFIER);
	CHECK(token.value == "col3");

	input >> token;

	CHECK(token.type == Tokenizer::PUNCTUATION);
	CHECK(token.value == ";");
}