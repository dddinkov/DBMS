#pragma once

#include <string>
#include <vector>
#include <cstddef>
#include <functional>
#include <fstream>
#include "dataColumn.h"

/// <summary>
/// A Node struct to represent each vertex in the BTree.
/// </summary>
struct Node
{
	/// <summary>
	/// The BTree Node has a set of keys, they are maintained in a sorted order (ascending).
	/// </summary>
	std::vector<std::string> keys;

	/// <summary>
	/// The BTree Node also has a set of children.
	/// </summary>
	std::vector<Node*> children;
	// vector of vectors of pointers to the position of datarows
	// since we allow duplicates we can have more than one.

	/// <summary>
	/// Each key will be linked to a series of streampos, pointing to the corresponding DataRows inside a specific table's deserialized contents.
	/// 
	/// We can't simply hold just one streampos because one key may refer to multiple rows (unless it's a primary key).
	/// </summary>
	std::vector<std::vector<std::streampos>> pointers;

	/// <summary>
	/// A default, and parameterized constructor.
	/// 
	/// Shallow copy for the children.
	/// </summary>
	Node(std::vector<std::string>, std::vector<Node*>, std::vector<std::vector<std::streampos>>);

	/// <summary>
	/// A simple binary serialization method for a Node in the BTree.
	/// 
	/// It takes a reference of type fstream and won't be closing it afterwards.
	/// </summary>
	void serialize(std::fstream&);

	/// <summary>
	/// A simple binary deserialization method for a Node in the BTree.
	/// 
	/// It takes a reference of type fstream and won't be closing it afterwards.
	/// </summary>
	void deserialize(std::fstream&);
};

/// <summary>
/// A class representing a self-balancing ordered tree structure which leaves are all on the same level.
/// </summary>
class BTree
{
private:
	/// <summary>
	/// t is a special number.
	/// A Node in the BTree must have at least t keys, and at most 2*t - 1 keys.
	/// </summary>
	std::size_t t;

	/// <summary>
	/// The root Node for the BTree.
	/// </summary>
	Node* root;

	/// <summary>
	/// The type of the keys we are storing (it's a string on first sight but it will be ordered differently based on the given type - int, string, bool, double).
	/// </summary>
	Type type;

	/// <summary>
	/// A function realizing a deep copy of the Node struct.
	/// </summary>
	Node* copy(Node*);

	/// <summary>
	/// A function to delete the given Node and all of its successors.
	/// </summary>
	void deallocate(Node*);

	/// <summary>
	/// A function to split a child given it's parent and the index at which the child to be split is.
	/// 
	/// We split a child in the insert function, and we split it when it's full.
	/// 
	/// When a child is split it's middle key (also the corresponding streampos vector) element moves to it's parent, keeping the order of the parents keys (and also of the streampos vectors), then the child is split in 2 halves, to which the parent will now point.
	/// </summary>
	void splitChild(Node*, const std::size_t&);

	/// <summary>
	/// When a Node is not full we will call this insert equivalent.
	/// </summary>
	void insertNonFull(Node*, const std::string&, const std::streampos&);

	/// <summary>
	/// Searches a Node by iterating it's keys to find the given key, or tries with a corresponding child.
	/// </summary>
	/// <returns>The found Node, nullptr if not found.</returns>
	Node* searchNode(Node* current, const std::string&);

	/// <summary>
	/// Searches a streampos vector by iterating a Node's keys to find the given key, or tries with a corresponding child.
	/// </summary>
	/// <returns>The found Node, nullptr if not found.</returns>
	std::vector<std::streampos> search(Node*, const std::string&);

	/// <summary>
	/// An inorder traversal of the given Node.
	/// </summary>
	/// <param name=""></param>
	/// <returns>A streampos vector of all DataRows' positions in ascending order of the keys (by type).</returns>
	std::vector<std::streampos> inorderTraversal(Node*);

	/// <summary>
	/// A function to compare two keys.
	/// </summary>
	/// <returns>Wheter leftKey < rightKey.</returns>
	bool lessThan(const std::string&, const std::string&);
public:
	/// <summary>
	/// A default constructor for a BTree.
	/// </summary>
	BTree();

	/// <summary>
	/// A parameterized constructor for a BTree.
	/// </summary>
	BTree(Type, const std::size_t&, Node*);

	/// <summary>
	/// A copy constructor for a BTree.
	/// </summary>
	/// <param name=""></param>
	BTree(const BTree&);

	/// <summary>
	/// operator= overload for a BTree.
	/// </summary>
	BTree& operator=(const BTree&);

	/// <summary>
	/// A destructor for a BTree.
	/// <\summary>
	~BTree();

	/// <summary>
	/// A function to insert a key, and a streampos in the tree.
	/// </summary>
	void insert(const std::string&, const std::streampos&);

	/// <summary>
	/// A function to find the streampos vector of a Node by the given key.
	/// </summary>
	std::vector<std::streampos> search(const std::string&);

	/// <summary>
	/// An inorder traversal of the root.
	/// </summary>
	/// <returns>A streampos vector of all DataRows' positions in ascending order of the keys (by type).</returns>
	std::vector<std::streampos> inorderTraversal();


	/// <summary>
	/// A simple binary serialization method for class BTree.
	/// 
	/// It takes a reference of type fstream and won't be closing it afterwards.
	/// </summary>
	void serialize(std::fstream&);

	/// <summary>
	/// A simple binary deserialization method for class BTree.
	/// 
	/// It takes a reference of type fstream and won't be closing it afterwards.
	/// </summary>
	void deserialize(std::fstream&);
};