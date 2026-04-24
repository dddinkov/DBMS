<?xml version="1.0"?><doc>
<members>
<member name="T:Type" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataColumn.h" line="8">
<summary>
Enumerates the datatypes we can use.

Types are String, Int, Double, Bool, and Null.
The type Null is used to identify an error. I do not allow nullable types in this project.
</summary>
</member>
<member name="F:DataColumn.name" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataColumn.h" line="23">
<summary>
A public field specifying the name of the column.
</summary>
</member>
<member name="F:DataColumn.type" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataColumn.h" line="28">
<summary>
A public field specifying the type of the column's fields.
</summary>
</member>
<member name="M:DataColumn.op_Equality(DataColumn!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataColumn.h" line="33">
<summary>
A DataColumn operator== overload, to check wheter their names match.
</summary>
</member>
<member name="M:DataColumn.serialize(std.basic_fstream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataColumn.h" line="38">
<summary>
A simple binary serialization method for DataColumn struct.

It takes a reference of type fstream and won't be closing it afterwards.
</summary>
</member>
<member name="M:DataColumn.deserialize(std.basic_fstream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataColumn.h" line="46">
<summary>
A simple binary deserialization method for DataColumn struct.

It takes a reference of type fstream and won't be closing it afterwards.
</summary>
</member>
<member name="T:std.hash{DataColumn}" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataColumn.h" line="56">
<summary>
Specialization of std::hash for the DataColumn struct.
</summary>
<summary>
Computes the hash value for a DataColumn object.
</summary>
</member>
<member name="T:std.equal_to{DataColumn}" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataColumn.h" line="74">
<summary>
Specialization of std::equal_to for the DataColumn struct.
</summary>
<summary>
Checks whether two DataColumn objects are equal.
</summary>
</member>
<member name="T:DataRow" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataRow.h" line="8">
<summary>
DataRow class to store a record in a table.
</summary>
</member>
<member name="F:DataRow.record" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataRow.h" line="13">
<summary>
A private unordered_map field using keys of type DataColumn and values of type string.

Used to access the row's contents or modify them by a given column.
</summary>
</member>
<member name="M:DataRow.validate(DataColumn!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataRow.h" line="20">
<summary>
A DataRow class private function to validate values, using a column's type for validation.
Throws exceptions on a Null type DataColumn object, or invalid literals (the string object).

Example:
If the DataColumn object is of type Bool we check whether the give string object is equal to or FALSE.
</summary>
</member>
<member name="M:DataRow.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataRow.h" line="29">
<summary>
A default constructor.

Literally does nothing.
</summary>
</member>
<member name="M:DataRow.add(DataColumn!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataRow.h" line="36">
<summary>
Adds a new field to the record, if it's valid.
</summary>
</member>
<member name="M:DataRow.update(DataColumn!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataRow.h" line="41">
<summary>
Updates a field in record, if it's valid.
</summary>
</member>
<member name="M:DataRow.op_Subscript(DataColumn!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataRow.h" line="46">
<summary>
Operator[] overload for class DataRow to access record field's elements (readonly).
</summary>
</member>
<member name="M:DataRow.serialize(std.basic_fstream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataRow.h" line="51">
<summary>
A simple binary serialization method for class DataRow.

It takes a reference of type fstream and won't be closing it afterwards.
</summary>
</member>
<member name="M:DataRow.deserialize(std.basic_fstream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\dataRow.h" line="58">
<summary>
A simple binary deserialization method for class DataRow.

It takes a reference of type fstream and won't be closing it afterwards.
</summary>
</member>
<!-- Discarding badly formed XML document comment for member 'M:op_LeftShift(std.basic_ostream<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}>*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,DataRow!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
<!-- Discarding badly formed XML document comment for member 'M:DataRow.compare(DataColumn!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,DataRow!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
<member name="T:Table" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="10">
<summary>
Class table represents a set of DataColumns and DataRows
</summary>
</member>
<member name="F:Table.name" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="15">
<summary>
A field to store the table's name.

Anonymous table may have the name "".
</summary>
</member>
<member name="F:Table.columns" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="22">
<summary>
A field to store the set of DataColumns.
</summary>
</member>
<member name="F:Table.rows" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="27">
<summary>
A field to store the set of DataRows.
</summary>
</member>
<member name="F:Table.primary_key" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="32">
<summary>
A field to store the primary key.

If the table doesn't have a primary key, it's type will be set to Null to indicate it.
</summary>
</member>
<member name="M:Table.check_key(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="39">
<summary>
A function that checks the primary key for duplicates.

Throws an error if it finds any
</summary>
</member>
<member name="M:Table.getCol(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="46">
<summary>
A function that iterates through the table's columns, to find a DataColumn with the given name.

If such DataColumn doesn't exist, it returns a DataColumn with type Null to indicate this.
</summary>
</member>
<member name="M:Table.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="53">
<summary>
A default constructor.

For anonymous tables.
</summary>
</member>
<member name="M:Table.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="60">
<summary>
A constructor with a single parameter for the table's name.
</summary>
</member>
<member name="M:Table.size" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="65">
<summary>
A getter for the size of the rows.
</summary>
<returns>The amount of rows in the table.</returns>
</member>
<member name="M:Table.addColumn(DataColumn!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="71">
<summary>
Adds the given DataColumn to the table.

If a column with the same name exists it will throw an error.
</summary>
</member>
<member name="M:Table.addRow(DataRow!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="78">
<summary>
Adds the given DataRow to the table.

If it breaks the uniqueness of the primary key of the table, it throws exception.
</summary>
</member>
<member name="M:Table.setPK(DataColumn!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="85">
<summary>
A setter for the primary key of the table
</summary>
</member>
<member name="M:Table.insert(std.vector&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,std.allocator&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="90">
<summary>
Inserts given values in the order of columns from user input of CREATE TABLE operation.
</summary>
</member>
<!-- Discarding badly formed XML document comment for member 'M:Table.update(std.vector<std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte>>,std.allocator<std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte>>>>!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.vector<std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runt'. -->
<member name="M:Table.orderBy(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="109">
<summary>
Sorting by a column in ascending order (true) or descending order (false).

An index may be used, if the user created any.
</summary>
<returns>The sorted table</returns>
</member>
<!-- Discarding badly formed XML document comment for member 'M:Table.filterBy(std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte>>!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte>>!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string<System.SByte!System.Runtime.CompilerServices.'. -->
<member name="M:Table.print(std.vector&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,std.allocator&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="126">
<summary>
Given list of identifiers, print the rows in the corresponding order (of columns).
</summary>
</member>
<member name="M:Table.save" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="131">
<summary>
A serializing function, to store table in a binary file with all it's data.

The table will be saved in name.bin.
</summary>
</member>
<member name="M:Table.read" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="138">
<summary>
A deserializing function, to read a table from a binary file.

The table will be read from name.bin.
</summary>
</member>
<member name="M:Table.count(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="145">
<summary>
An aggregate function - COUNT, accepts an identifier (DataColumn's name).

The * identifier is valid for this function as well.
Throws exception if the column doesn't exist.
</summary>
<returns>Returns the amount of rows in the table.</returns>
</member>
<member name="M:Table.min(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="154">
<summary>
An aggregate function - MIN, accepts an identifier (DataColumn's name).

Throws exception if the column doesn't exist.
</summary>
<returns>Returns the smallest element from the given column.</returns>
</member>
<member name="M:Table.max(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="162">
<summary>
An aggregate function - MAX, accepts an identifier (DataColumn's name).

Throws exception if the column doesn't exist.
</summary>
<returns>Returns the biggest element from the given column.</returns>
</member>
<member name="M:Table.avg(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="170">
<summary>
An aggregate function - AVG, accepts an identifier (DataColumn's name).

Throws exception if the column doesn't exist, or it's type is not Double or Int.
</summary>
<returns>Returns the average value of all fields in the given column.</returns>
</member>
<member name="M:Table.sum(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="178">
<summary>
An aggregate function - SUM, accepts an identifier (DataColumn's name).

Throws exception if the column doesn't exist, or it's type is not Double or Int.
</summary>
<returns>Returns the sum of all fields in the given column.</returns>
</member>
<member name="M:Table.createIndex(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\table.h" line="186">
<summary>
Creates a BTree (Index tree) on the given column identifier (DataColumn name) and saves it in a separate file.

The file in which the index tree is stored is labeled name_columnName.bin

Throws exception if column doesn't exist.
</summary>
</member>
<!-- Discarding badly formed XML document comment for member 'M:op_LeftShift(std.basic_ostream<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}>*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Table!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
<member name="T:Node" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="10">
<summary>
A Node struct to represent each vertex in the BTree.
</summary>
</member>
<member name="F:Node.keys" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="15">
<summary>
The BTree Node has a set of keys, they are maintained in a sorted order (ascending).
</summary>
</member>
<member name="F:Node.children" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="20">
<summary>
The BTree Node also has a set of children.
</summary>
</member>
<member name="F:Node.pointers" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="27">
<summary>
Each key will be linked to a series of streampos, pointing to the corresponding DataRows inside a specific table's deserialized contents.

We can't simply hold just one streampos because one key may refer to multiple rows (unless it's a primary key).
</summary>
</member>
<member name="M:Node.#ctor(std.vector&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,std.allocator&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;&gt;&gt;,std.vector&lt;Node**,std.allocator&lt;Node**&gt;&gt;,std.vector&lt;std.vector&lt;std.fpos&lt;_Mbstatet&gt;,std.allocator&lt;std.fpos&lt;_Mbstatet&gt;&gt;&gt;,std.allocator&lt;std.vector&lt;std.fpos&lt;_Mbstatet&gt;,std.allocator&lt;std.fpos&lt;_Mbstatet&gt;&gt;&gt;&gt;&gt;)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="34">
<summary>
A default, and parameterized constructor.

Shallow copy for the children.
</summary>
</member>
<member name="M:Node.serialize(std.basic_fstream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="41">
<summary>
A simple binary serialization method for a Node in the BTree.

It takes a reference of type fstream and won't be closing it afterwards.
</summary>
</member>
<member name="M:Node.deserialize(std.basic_fstream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="48">
<summary>
A simple binary deserialization method for a Node in the BTree.

It takes a reference of type fstream and won't be closing it afterwards.
</summary>
</member>
<member name="T:BTree" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="56">
<summary>
A class representing a self-balancing ordered tree structure which leaves are all on the same level.
</summary>
</member>
<member name="F:BTree.t" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="62">
<summary>
t is a special number.
A Node in the BTree must have at least t keys, and at most 2*t - 1 keys.
</summary>
</member>
<member name="F:BTree.root" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="68">
<summary>
The root Node for the BTree.
</summary>
</member>
<member name="F:BTree.type" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="73">
<summary>
The type of the keys we are storing (it's a string on first sight but it will be ordered differently based on the given type - int, string, bool, double).
</summary>
</member>
<member name="M:BTree.copy(Node*)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="78">
<summary>
A function realizing a deep copy of the Node struct.
</summary>
</member>
<member name="M:BTree.deallocate(Node*)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="83">
<summary>
A function to delete the given Node and all of its successors.
</summary>
</member>
<member name="M:BTree.splitChild(Node*,System.UInt32!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="88">
<summary>
A function to split a child given it's parent and the index at which the child to be split is.

We split a child in the insert function, and we split it when it's full.

When a child is split it's middle key (also the corresponding streampos vector) element moves to it's parent, keeping the order of the parents keys (and also of the streampos vectors), then the child is split in 2 halves, to which the parent will now point.
</summary>
</member>
<member name="M:BTree.insertNonFull(Node*,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.fpos&lt;_Mbstatet&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="97">
<summary>
When a Node is not full we will call this insert equivalent.
</summary>
</member>
<member name="M:BTree.searchNode(Node*,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="102">
<summary>
Searches a Node by iterating it's keys to find the given key, or tries with a corresponding child.
</summary>
<returns>The found Node, nullptr if not found.</returns>
</member>
<member name="M:BTree.search(Node*,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="108">
<summary>
Searches a streampos vector by iterating a Node's keys to find the given key, or tries with a corresponding child.
</summary>
<returns>The found Node, nullptr if not found.</returns>
</member>
<member name="M:BTree.inorderTraversal(Node*)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="114">
<summary>
An inorder traversal of the given Node.
</summary>
<param name=""></param>
<returns>A streampos vector of all DataRows' positions in ascending order of the keys (by type).</returns>
</member>
<!-- Discarding badly formed XML document comment for member 'M:BTree.lessThan(std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte>>!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte>>!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
<member name="M:BTree.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="127">
<summary>
A default constructor for a BTree.
</summary>
</member>
<member name="M:BTree.#ctor(Type,System.UInt32!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Node*)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="132">
<summary>
A parameterized constructor for a BTree.
</summary>
</member>
<member name="M:BTree.#ctor(BTree!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="137">
<summary>
A copy constructor for a BTree.
</summary>
<param name=""></param>
</member>
<member name="M:BTree.op_Assign(BTree!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="143">
<summary>
operator= overload for a BTree.
</summary>
</member>
<!-- Discarding badly formed XML document comment for member 'M:BTree.Dispose'. -->
<member name="M:BTree.insert(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.fpos&lt;_Mbstatet&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="153">
<summary>
A function to insert a key, and a streampos in the tree.
</summary>
</member>
<member name="M:BTree.search(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="158">
<summary>
A function to find the streampos vector of a Node by the given key.
</summary>
</member>
<member name="M:BTree.inorderTraversal" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="163">
<summary>
An inorder traversal of the root.
</summary>
<returns>A streampos vector of all DataRows' positions in ascending order of the keys (by type).</returns>
</member>
<member name="M:BTree.serialize(std.basic_fstream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="170">
<summary>
A simple binary serialization method for class BTree.

It takes a reference of type fstream and won't be closing it afterwards.
</summary>
</member>
<member name="M:BTree.deserialize(std.basic_fstream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\btree.h" line="177">
<summary>
A simple binary deserialization method for class BTree.

It takes a reference of type fstream and won't be closing it afterwards.
</summary>
</member>
</members>
</doc>