#include "tokenizer.h"
#include <cctype>
#include <exception>
#include <sstream>

const std::string Tokenizer::KEYWORDS[] =
{
	"CREATE",
	"TABLE",
	"PRIMARY",
	"KEY",
	"INSERT",
	"INTO",
	"UPDATE",
	"SET",
	"WHERE",
	"SELECT",
	"FROM",
	"ORDER",
	"BY",
	"ASC",
	"DESC",
	"COUNT",
	"MAX",
	"MIN",
	"AVG",
	"SUM",
	"INDEX",
	"on"
};

const std::string Tokenizer::DATATYPES[] = { "bool", "string", "int", "double" };

const std::string Tokenizer::PUNCTUATION_CHARACTERS = ",();";

Tokenizer::Tokenizer(std::istream& in) :in(in), peeked(nullptr) { }

std::istream& operator>>(std::istream& in, Tokenizer::Token &t)
{
	char next = in.peek();

	// Clear whitespaces
	while (next == ' ' || next == '\n' || next == '\t')
	{
		in.get();
		next = in.peek();
	}

	// Starting with letter or _ is keyword or identifier, maybe bool literal
	if (std::isalpha(next) || next == '_')
	{
		std::string word;
		while (std::isalpha(next) || next == '_' || std::isdigit(next))
		{
			word.push_back(next);

			in.get();
			next = in.peek();
		}

		if (Tokenizer::isBoolLiteral(word))
		{
			t.type = Tokenizer::LITERAL;
			t.value = word;
			return in;
		}

		if (Tokenizer::isKeyword(word))
		{
			t.type = Tokenizer::KEYWORD;
			t.value = word;
			return in;
		}

		if (Tokenizer::isDatatype(word))
		{
			t.type = Tokenizer::DATATYPE;
			t.value = word;
			return in;
		}

		if (Tokenizer::isIdentifier(word))
		{
			t.type = Tokenizer::IDENTIFIER;
			t.value = word;
			return in;
		}
		throw std::exception("I don't know what's wrong, honestly!");
	}

	// A single * will be considered an identifier
	if (next == '*')
	{
		t.type = Tokenizer::IDENTIFIER;
		t.value = "*";
		in.get();
		return in;
	}

	// Identifying punctuation
	if (Tokenizer::PUNCTUATION_CHARACTERS.find(next) != -1)
	{
		t.type = Tokenizer::PUNCTUATION;
		t.value = next;
		in.get();
		return in;
	}

	// Identifying operators (max 2 characters)
	if (next == '=')
	{
		t.type = Tokenizer::OPERATOR;
		t.value = "=";
		in.get();
		return in;
	}
	else if (next == '!' || next == '<' || next == '>')
	{
		t.type = Tokenizer::OPERATOR;
		t.value = next;
		in.get();
		next = in.peek();
		if (next == '=')
		{
			in.get();
			t.value.push_back('=');
		}
		return in;
	}

	// Identifying literals

	// String literal
	if (next == '"')
	{
		std::string word;
		word.push_back(next);
		
		in.get();
		next = in.peek();
		
		while (next != '"')
		{
			if (next == '\\')
			{
				in.get();
				next = in.peek();
			}
			word.push_back(next);

			in.get();
			next = in.peek();
		}

		word.push_back(next);
		in.get();

		if (Tokenizer::isStringLiteral(word))
		{
			t.type = Tokenizer::LITERAL;
			t.value = word;
			return in;
		}

		std::string message = "An invalid string literal: " + word;

		throw std::invalid_argument(message);
	}

	// Double and int literals
	if (std::isdigit(next) || next == '-' || next == '.') // .94 is a valid double
	{
		std::string word;

		do
		{
			word.push_back(next);

			in.get();
			next = in.peek();
		} while (std::isdigit(next) || next == '.');

		if (Tokenizer::isLiteral(word))
		{
			t.type = Tokenizer::LITERAL;
			t.value = word;
			return in;
		}

		std::string message = "An invalid expression: " + word;

		throw std::invalid_argument(message);
	}

	// Bool literal is checked above with identifiers and keywords

	// Not forgetting to read the end when we reach it
	if (in.peek() == '\0')
	{
		in.get();
	}

	return in;
}

std::ostream& operator<<(std::ostream& os, const Tokenizer::Token& t)
{
	switch (t.type)
	{
		case Tokenizer::IDENTIFIER:
			os << "IDENTIFIER:";
			break;

		case Tokenizer::KEYWORD:
			os << "KEYWORD:";
			break;

		case Tokenizer::LITERAL:
			os << "LITERAL:";
			break;

		case Tokenizer::OPERATOR:
			os << "OPERATOR:";
			break;

		case Tokenizer::PUNCTUATION:
			os << "PUNCTUATION:";
			break;
	}
	os << t.value;
	return os;
}

bool Tokenizer::isKeyword(const std::string& word)
{
	for (const std::string& keyword : KEYWORDS)
	{
		if (word == keyword)
		{
			return true;
		}
	}

	return false;
}

bool Tokenizer::isIdentifier(const std::string& word)
{
	if (word == "" || std::isdigit(word[0]))
	{
		return false;
	}

	std::size_t index = 0;
	char current = word[index];

	while (index < word.size() ||
		(std::isalpha(current) || current == '_') ||
		(index > 0 && std::isdigit(current)))
	{
		current = word[++index];
	}

	return index == word.size();
}

bool Tokenizer::isLiteral(const std::string& word)
{
	if (word == "")
	{
		return false;
	}
	return Tokenizer::isBoolLiteral(word) ||
		Tokenizer::isStringLiteral(word) ||
		Tokenizer::isIntLiteral(word) ||
		Tokenizer::isDoubleLiteral(word);
}

bool Tokenizer::isBoolLiteral(const std::string& word)
{
	if (word == "True" || word == "False")
	{
		return true;
	}

	return false;
}

bool Tokenizer::isStringLiteral(const std::string& word)
{
	if (word[0] == '"' && word[word.size() - 1] == '"')
	{
		if (word.size() > 1)
		{
			return true;
		}
	}
	return false;
}

bool Tokenizer::isIntLiteral(const std::string& word)
{
	// leading zeros are ignored (0001 == 1), they are not deleted!
	std::size_t index = 0;
	if (word[0] == '-')
	{
		index = 1;
	}
	for (std::size_t i = index; i < word.size() ; ++i)
	{
		if (!std::isdigit(word[i]))
		{
			return false;
		}
	}
	return true;
}

bool Tokenizer::isDoubleLiteral(const std::string& word)
{
	bool hasDot = false;
	bool hasDigit = false;

	std::size_t index = 0;
	if (word[index] == '-')
	{
		++index;
	}
	for (std::size_t i = index; i < word.size(); ++i)
	{
		if (std::isdigit(word[i]))
		{
			hasDigit = true;
		}
		else if (word[i] == '.')
		{
			if (hasDot) // finding more than 1 dots is invalid
			{
				return false;
			}
			hasDot = true;
		}
		else
		{
			return false;
		}
	}
	return hasDigit;
}

bool Tokenizer::isDatatype(const std::string& word)
{
	for (const std::string& datatype : Tokenizer::DATATYPES)
	{
		if (word == datatype)
		{
			return true;
		}
	}
	return false;
}

typename Tokenizer::Token Tokenizer::getNextToken()
{
	typename Tokenizer::Token result;
	
	if (peeked != nullptr)
	{
		result = *peeked;
		delete peeked;
		peeked = nullptr;
	}

	in >> result;

	return result;

}

typename Tokenizer::Token Tokenizer::peek()
{
	if (peeked != nullptr)
	{
		delete peeked;
		peeked = nullptr;
	}

	std::streampos currentPosition = in.tellg();

	std::stringstream copyStream;
	copyStream.str("");
	copyStream.clear();
	copyStream << in.rdbuf();


	in.seekg(currentPosition);

	peeked = new Token;
	copyStream >> *peeked;

	return *peeked;
}