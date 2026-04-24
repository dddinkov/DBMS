#include "btree.h"
#include <iostream>
#include <exception>

Node::Node(std::vector<std::string> keys = std::vector<std::string>(), std::vector<Node*> children = std::vector<Node*>(), std::vector<std::vector<std::streampos>> pointers = std::vector<std::vector<std::streampos>>())
{
	this->keys = keys;
	this->children = children;
	this->pointers = pointers;
}

void Node::serialize(std::fstream& os)
{
	std::size_t keysLength = keys.size(),
		pointersLength = pointers.size(),
		childrenLength = children.size();

	os.write(reinterpret_cast<const char*>(&keysLength), sizeof(std::size_t));

	for (std::string& key : keys)
	{
		std::size_t size = key.size();
		os.write(reinterpret_cast<const char*>(&size), sizeof(std::size_t));
		os.write(key.c_str(), key.size());
	}

	os.write(reinterpret_cast<const char*>(&pointersLength), sizeof(std::size_t));

	for (std::vector<std::streampos>& listOfPointers : pointers)
	{
		std::size_t size = listOfPointers.size();

		os.write(reinterpret_cast<const char*>(&size), sizeof(std::size_t));

		for (std::streampos& pointer : listOfPointers)
		{
			os.write(reinterpret_cast<const char*>(&pointer), sizeof(std::streampos));
		}
	}

	os.write(reinterpret_cast<const char*>(&childrenLength), sizeof(std::size_t));

	for (Node*& child : children)
	{
		child->serialize(os);
	}
}

void Node::deserialize(std::fstream& istr)
{
	std::size_t keysLength,
		pointersLength,
		childrenLength;

	istr.read(reinterpret_cast<char*>(&keysLength), sizeof(std::size_t));

	for (std::size_t i = 0; i < keysLength; ++i)
	{
		std::size_t size;
		istr.read(reinterpret_cast<char*>(&size), sizeof(std::size_t));

		char* buffer = new char[size + 1];
		istr.read(buffer, size);
		buffer[size] = '\0';

		keys.push_back(buffer);
	}

	istr.read(reinterpret_cast<char*>(&pointersLength), sizeof(std::size_t));

	for (std::size_t i = 0; i < pointersLength; ++i)
	{
		std::size_t size;

		istr.read(reinterpret_cast<char*>(&size), sizeof(std::size_t));

		pointers.push_back(std::vector<std::streampos>());

		for (std::size_t j = 0; j < size; ++j)
		{
			std::streampos pointer;
			istr.read(reinterpret_cast<char*>(&pointer), sizeof(std::streampos));
			
			pointers[i].push_back(pointer);
		}
	}

	istr.read(reinterpret_cast<char*>(&childrenLength), sizeof(std::size_t));

	for (std::size_t i = 0; i < childrenLength; ++i)
	{
		Node* child = new Node();
		child->deserialize(istr);
		children.push_back(child);
	}
}

Node* BTree::copy(Node* current)
{
	std::vector<Node*> copyChildren;
	for (Node* child : current->children)
	{
		copyChildren.push_back(copy(child));
	}

	return new Node(current->keys, copyChildren);
}

void BTree::deallocate(Node* current)
{
	if (current == nullptr)
	{
		return;
	}

	for (Node*& child : current->children)
	{
		deallocate(child);
	}

	delete current;
}

// Middle element will be inserted in the parent and the child will be evenly split into 2.
void BTree::splitChild(Node* parent, const std::size_t& childIndex)
{
	Node* child = parent->children[childIndex];

	Node* newChild = new Node();
	parent->children.insert(parent->children.begin() + childIndex + 1, newChild);

	parent->keys.insert(parent->keys.begin() + childIndex, child->keys[t - 1]);
	parent->pointers.insert(parent->pointers.begin() + childIndex, child->pointers[t - 1]);

	newChild->keys = std::vector<std::string>(child->keys.begin() + t, child->keys.end());
	child->keys = std::vector<std::string>(child->keys.begin(), child->keys.begin() + t - 1);

	newChild->pointers = std::vector<std::vector<std::streampos>>(child->pointers.begin() + t, child->pointers.end());
	child->pointers = std::vector<std::vector<std::streampos>>(child->pointers.begin(), child->pointers.begin() + t - 1);

	// if child is not a leaf we also split it's children evenly between child and newChild
	if (!child->children.empty())
	{
		newChild->children = std::vector<Node*>(child->children.begin() + t, child->children.end());
		child->children = std::vector<Node*>(child->children.begin(), child->children.begin() + t);
	}
}

void BTree::insertNonFull(Node* current, const std::string& key, const std::streampos& pointer)
{
	// Index of rightmost key
	int i = current->keys.size() - 1;

	// If current is a leaf
	if (current->children.empty())
	{
		current->keys.push_back(""); // to increase the size of the vector
		current->pointers.push_back(std::vector<std::streampos>());
		while (i >= 0 && lessThan(key, current->keys[i]))
		{
			current->keys[i + 1] = current->keys[i];
			current->pointers[i + 1] = current->pointers[i];
			current->pointers[i] = std::vector<std::streampos>();
			--i;
		}

		current->keys[i+1] = key;
		current->pointers[i+1].push_back(pointer);

		return;
	}

	// If current is not a leaf, we need to locate the child to insert the key in
	while (i >= 0 && lessThan(key, current->keys[i]))
	{
		--i;
	}

	// If the child is full, split it
	if (current->children[i + 1]->keys.size() == 2 * t - 1)
	{
		splitChild(current, i + 1);

		// Decide which one form the splitted will get the key
		if (lessThan(current->keys[i+1], key))
		{
			++i;
		}
	}

	insertNonFull(current->children[i + 1], key, pointer);
}

Node* BTree::searchNode(Node* current, const std::string& key)
{
	if (current == nullptr)
	{
		return nullptr;
	}
	int i = 0;
	while (i < current->keys.size() && lessThan(current->keys[i], key)) // key > current...
	{
		++i;
	}

	// If key is found
	if (i < current->keys.size() && current->keys[i] == key)
	{
		return current;
	}

	// If key isn't found, and we are in a leaf
	if (current->children.empty())
	{
		return nullptr;
	}

	// Recursive call to search in the corresponding child
	return searchNode(current->children[i], key);
}

std::vector<std::streampos> BTree::search(Node* current, const std::string& key)
{
	int i = 0;
	while (i < current->keys.size() && lessThan(current->keys[i], key)) // key > current...
	{
		++i;
	}

	// If key is found
	if (i < current->keys.size() && current->keys[i] == key)
	{
		return current->pointers[i];
	}

	// If key isn't found, and we are in a leaf
	if (current->children.empty())
	{
		return std::vector<std::streampos>();
	}

	// Recursive call to search in the corresponding child
	return search(current->children[i], key);
}

std::vector<std::streampos> BTree::inorderTraversal(Node* current)
{
	if (current == nullptr)
	{
		return std::vector<std::streampos>();
	}

	std::vector<std::streampos> res;

	if (current->children.empty())
	{
		for (std::vector<std::streampos>& positions : current->pointers)
		{
			res.insert(res.end(), positions.begin(), positions.end());
		}
		return res;
	}

	for (std::size_t i = 0; i < current->children.size(); ++i)
	{
		std::vector<std::streampos> childTraverse = inorderTraversal(current->children[i]);

		res.insert(res.end(), childTraverse.begin(), childTraverse.end());

		if (i < current->pointers.size())
		{
			res.insert(res.end(), current->pointers[i].begin(), current->pointers[i].end());
		}
	}

	return res;
}

bool BTree::lessThan(const std::string& s1, const std::string& s2)
{
	if (type == Type::String)
	{
		return s1 < s2;
	}

	if (type == Type::Int || type == Type::Double)
	{
		double a = std::stod(s1), 
			b = std::stod(s2);
		return a < b;
	}

	if (type == Type::Bool)
	{
		if (s1 == s2 || s1 == "TRUE")
		{
			return false;
		}
		return true;
	}

	throw "Error: BTree with type Null.";
}

BTree::BTree() : t(2), root(nullptr), type(Type::Null) {}

BTree::BTree(Type type, const std::size_t& t, Node* root = nullptr) : t(t), root(root), type(type) {}

BTree::BTree(const BTree& other)
{
	copy(other.root);
}

BTree& BTree::operator=(const BTree& other)
{
	if (this != &other)
	{
		deallocate(root);
		root = copy(other.root);
	}
	return *this;
}

BTree::~BTree()
{
	deallocate(root);
}

void BTree::insert(const std::string& key, const std::streampos& pointer)
{
	Node* existingNode = searchNode(root, key);
	if (existingNode != nullptr)
	{
		std::size_t i = 0;
		while (existingNode->keys[i] != key)
		{
			++i;
		}
		existingNode->pointers[i].push_back(pointer);
		return;
	}

	if (this->root == nullptr)
	{
		root = new Node();
		root->keys.push_back(key);

		root->pointers.push_back(std::vector<std::streampos>());
		root->pointers[0].push_back(pointer);
		return;
	}

	// If root's keys are full -> increase height.
	if (root->keys.size() == 2 * t - 1)
	{
		Node* newRoot = new Node();

		newRoot->children.push_back(root);


		splitChild(newRoot, 0);

		// Decide which child will have the key.
		std::size_t i = lessThan(newRoot->keys[0], key) ? 1 : 0;

		insertNonFull(newRoot->children[i], key, pointer);

		this->root = newRoot;
		return;
	}

	// If root is not full
	insertNonFull(root, key, pointer);
}

std::vector<std::streampos> BTree::search(const std::string& key)
{
	// If tree is empty, nothing is inside
	if (root == nullptr)
	{
		return std::vector<std::streampos>();
	}

	// Else we traverse the root for the key
	return search(root, key);
}

std::vector<std::streampos> BTree::inorderTraversal()
{
	if (root == nullptr)
	{
		return std::vector<std::streampos>();
	}
	return inorderTraversal(root);
}

void BTree::serialize(std::fstream& os)
{
	os.write(reinterpret_cast<const char*>(&t), sizeof(std::size_t));
	os.write(reinterpret_cast<const char*>(&type), sizeof(Type));

	if (root != nullptr)
	{
		root->serialize(os);
	}
	else
	{
		// If root is nullptr, we will serialize an empty Node to avoid errors
		Node fakeRoot;
		fakeRoot.serialize(os);
	}
}

void BTree::deserialize(std::fstream& istr)
{
	istr.read(reinterpret_cast<char*>(&t), sizeof(std::size_t));
	istr.read(reinterpret_cast<char*>(&type), sizeof(Type));

	if (root == nullptr)
	{
		root = new Node();
	}
	root->deserialize(istr);
}