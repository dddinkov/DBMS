#ifndef DOCTEST_CONFIG_IMPLEMENT_BTREE
#define DOCTEST_CONFIG_IMPLEMENT_BTREE
#endif
#include "../doctest.h"
#include "../btree.h"
#include <fstream>

TEST_CASE("BTree class tests")
{
	BTree tree(Type::Int, 2, nullptr);

	// 1,2,...,15 in a random order, streampos is the same for aesthetic purposes
	tree.insert("4", std::streampos(4));
	tree.insert("7", std::streampos(7));
	tree.insert("1", std::streampos(1));
	tree.insert("2", std::streampos(2));
	tree.insert("6", std::streampos(6));
	tree.insert("5", std::streampos(5));
	tree.insert("9", std::streampos(9));
	tree.insert("3", std::streampos(3));
	tree.insert("8", std::streampos(8));
	tree.insert("10", std::streampos(10));
	tree.insert("14", std::streampos(14));
	tree.insert("12", std::streampos(12));
	tree.insert("11", std::streampos(11));
	tree.insert("15", std::streampos(15));
	tree.insert("13", std::streampos(13));


	//1 2 3 4 5 6 7 8 9 ... (should be sorted)
	std::vector<std::streampos> expectedTraversal;

	for (std::size_t i = 1; i < 16; ++i)
	{
		expectedTraversal.push_back(std::streampos(i));
	}

	std::vector<std::streampos> traversal = tree.inorderTraversal();

	for (std::size_t i = 0; i < traversal.size(); ++i)
	{
		CHECK_EQ(traversal[i], expectedTraversal[i]);
	}

	// we will insert one more value (streampos) at the biggest element
	tree.insert("15", std::streampos(16));

	std::vector<std::streampos> key15Pointers = tree.search("15");

	CHECK_EQ(key15Pointers[0],std::streampos(15));
	CHECK_EQ(key15Pointers[1],std::streampos(16));

	expectedTraversal.push_back(std::streampos(16));

	traversal = tree.inorderTraversal();

	for (std::size_t i = 0; i < traversal.size(); ++i)
	{
		CHECK_EQ(traversal[i], expectedTraversal[i]);
	}

	SUBCASE("BTree serialization/deserialization tests")
	{
		std::string fileName = "Unit tests/testBTreeSerialization.bin";

		std::fstream out(fileName, std::ios::binary | std::ios::out);
		tree.serialize(out);
		out.close();

		std::fstream istr(fileName, std::ios::binary | std::ios::in);

		BTree temp;
		temp.deserialize(istr);
		istr.close();

		std::vector<std::streampos> tempTraversal = temp.inorderTraversal();

		for (std::size_t i = 0; i < 16; ++i)
		{
			CHECK_EQ(tempTraversal[i], expectedTraversal[i]);
		}
	}
}