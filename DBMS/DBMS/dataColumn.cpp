#include "dataColumn.h"

bool DataColumn::operator==(const DataColumn& other)
{
	return name == other.name;
}

void DataColumn::serialize(std::fstream& os)
{
	std::size_t nameLength = name.size();
	os.write(reinterpret_cast<const char*>(&nameLength), sizeof(std::size_t));
	os.write(name.c_str(), nameLength);

	os.write(reinterpret_cast<const char*>(&type), sizeof(Type));
}

void DataColumn::deserialize(std::fstream& istr)
{
	std::size_t nameLength;
	istr.read(reinterpret_cast<char*>(&nameLength), sizeof(std::size_t));

	char* buffer = new char[nameLength + 1];
	istr.read(buffer, nameLength);
	buffer[nameLength] = '\0';
	name = std::string(buffer);
	delete[] buffer;

	istr.read(reinterpret_cast<char*>(&type), sizeof(Type));
}