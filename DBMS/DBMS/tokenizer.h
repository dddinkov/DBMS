#pragma once

#include <iostream>
#include <string>
#include <vector>

class Tokenizer
{
public:
	enum Tokens
	{
		KEYWORD,
		DATATYPE,
		IDENTIFIER,
		LITERAL,
		PUNCTUATION,
		OPERATOR
	};

	struct Token
	{
		Tokens type;
		std::string value;
	};

	Tokenizer(std::istream&);

	Token getNextToken();
	Token peek();

private:
	const static std::string KEYWORDS[];
	const static std::string DATATYPES[];
	const static std::string PUNCTUATION_CHARACTERS;
	std::istream& in;
	Token* peeked;

	static bool isKeyword(const std::string&);
	static bool isIdentifier(const std::string&);
	static bool isLiteral(const std::string&);

	static bool isBoolLiteral(const std::string&);
	static bool isStringLiteral(const std::string&);
	static bool isIntLiteral(const std::string&);
	static bool isDoubleLiteral(const std::string&);
	static bool isDatatype(const std::string&);

	friend std::istream& operator>>(std::istream&, Tokenizer::Token&);
	friend std::ostream& operator<<(std::ostream&, const Tokenizer::Token&);
};