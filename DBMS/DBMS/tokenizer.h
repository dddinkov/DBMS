#pragma once

#include <iostream>
#include <string>
#include <vector>

/// <summary>
/// A tokenizer class to simplify user input in separate tokens.
/// </summary>
class Tokenizer
{
public:
	/// <summary>
	/// Enumerates the fundamental elements (tokens) of the Tokenizer.
	/// </summary>
	enum Tokens
	{
		/// <summary>
		/// Represents keywords.
		/// </summary>
		KEYWORD,

		/// <summary>
		/// Represents datatypes - int, string, bool, and double.
		/// </summary>
		DATATYPE,

		/// <summary>
		/// Represents identifiers - words containing all letters, the symbol '_', and digits.
		/// An identifier cannot begin with a digit!
		/// </summary>
		IDENTIFIER,

		/// <summary>
		/// Represents literals - int, string, bool, and double literals.
		/// </summary>
		LITERAL,

		/// <summary>
		/// Represents punctuation characters - '(', ')', ',', ';'.
		/// </summary>
		PUNCTUATION,

		/// <summary>
		/// Represents operators - =, !=, <, <=, >, >=.
		/// </summary>
		OPERATOR
	};

	/// <summary>
	/// Represents the fundamental elements of a tokenizer.
	/// They are called tokens.
	/// </summary>
	struct Token
	{
		/// <summary>
		/// Represents the type of the token.
		/// </summary>
		Tokens type;

		/// <summary>
		/// Holds the meaning of the token.
		/// </summary>
		std::string value;
	};

	/// <summary>
	/// Tokenizer constructor taking input stream object by reference.
	/// </summary>
	Tokenizer(std::istream&);

	/// <summary>
	/// A Tokenizer function to read the upcoming token from the private field in.
	/// </summary>
	Token getNextToken();

	/// <summary>
	/// A Tokenizer function to peek the next token, without reading it.
	/// 
	/// The function does not read the token from the private in object, but rather makes a buffer to store the contents of it and read the token from there.
	/// </summary>
	Token peek();

	/// <summary>
	/// A Tokenizer destructor to release dynamic fields.
	/// 
	/// In this case release peeked if it's not released.
	/// </summary>
	~Tokenizer();

private:
	/// <summary>
	/// A static array field containing all keywords' values.
	/// 
	/// They are CREATE, TABLE, PRIMARY, KEY, INSERT, INTO, UPDATE, SET, WHERE, SELECT, FROM, ORDER, BY, ASC, DESC, COUNT, MAX, MIN, AVG, SUM, INDEX, and ON.
	/// </summary>
	const static std::string KEYWORDS[];

	/// <summary>
	/// A static array field containing all datatypes' values - int, string, bool, and double.
	/// </summary>
	const static std::string DATATYPES[];

	/// <summary>
	/// A static string field containing all punctuation characters.
	/// 
	/// Actual value - ",();"
	/// </summary>
	const static std::string PUNCTUATION_CHARACTERS;

	/// <summary>
	/// An input stream object from which the tokens will be read from.
	/// </summary>
	std::istream& in;

	/// <summary>
	/// A dynamic Token field to host the latest peeked token.
	/// </summary>
	Token* peeked;

	/// <summary>
	/// A static function to identify keywords.
	/// </summary>
	static bool isKeyword(const std::string&);

	/// <summary>
	/// A static function to identify identifiers.
	/// </summary>
	static bool isIdentifier(const std::string&);

	/// <summary>
	/// A static function to identify literals.
	/// 
	/// Checks whether the give string is a boolean, string, int, or double literal.
	/// </summary>
	static bool isLiteral(const std::string&);

	/// <summary>
	/// A static function to identify boolean literals.
	/// 
	/// 
	/// </summary>
	static bool isBoolLiteral(const std::string&);

	/// <summary>
	/// A static function to identify string literals.
	/// 
	/// A string is defined by being enclosed in double quotes ("").
	/// \" and \\ are allowed as escaped characters.
	/// </summary>
	static bool isStringLiteral(const std::string&);

	/// <summary>
	/// A static function to identify int literals.
	/// </summary>
	static bool isIntLiteral(const std::string&);

	/// <summary>
	/// A static function to identify double literals.
	/// 
	/// Int literals are also considered double literals.
	/// -.0, .0 are also considered valid double literals.
	/// </summary>
	static bool isDoubleLiteral(const std::string&);

	/// <summary>
	/// A static function to identify datatypes.
	/// 
	/// The actual words - int, string, bool, and double.
	/// </summary>
	static bool isDatatype(const std::string&);

	/// <summary>
	/// A Tokenizer-friendly overload for operator>> for inputting a token from istream object.
	/// 
	/// Throws exceptions on unspecified tokens.
	/// </summary>
	friend std::istream& operator>>(std::istream&, Tokenizer::Token&);

	/// <summary>
	/// A Tokenizer-friendly overload for operator<< for outputing a token to ostream object.
	/// 
	/// 
	/// </summary>
	friend std::ostream& operator<<(std::ostream&, const Tokenizer::Token&);
};