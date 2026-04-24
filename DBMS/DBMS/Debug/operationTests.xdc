<?xml version="1.0"?><doc>
<members>
<member name="T:Operation" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\operation.h" line="5">
<summary>
Abstract class Operation.

Follows the following rule from the grammar:
OPERATION = QUERY | CREATE_TABLE | INSERT_INTO | UPDATE | CREATE_INDEX
</summary>
</member>
<member name="M:Operation.eval" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\operation.h" line="14">
<summary>
A pure virtual function to evaluate the operation.
</summary>
</member>
<member name="M:Operation.clone" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\operation.h" line="19">
<summary>
A pure virtual clone function.
</summary>
<returns></returns>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Operation**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\operation.h" line="25">
<summary>
A friendly operator&gt;&gt; overload to input an Operation.
</summary>
</member>
<member name="M:Operation.Dispose" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\operation.h" line="30">
<summary>
A default destructor.
</summary>
</member>
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
<member name="T:QueryArguments" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\queryArguments.h" line="6">
<summary>
Abstract class QueryArgumets

Following the following grammar rule:
QUERY_ARGUMENTS = COLUMNS | AGGREGATES
</summary>
</member>
<member name="M:QueryArguments.print(Table!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\queryArguments.h" line="15">
<summary>
Pure virtual print function to display the columns/aggregate values (query arguments).
</summary>
<param name="">A Table</param>
</member>
<member name="M:QueryArguments.clone" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\queryArguments.h" line="21">
<summary>
A clone function.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,QueryArguments**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\queryArguments.h" line="26">
<summary>
operator&gt;&gt; overload for inputting QueryArguments.
</summary>
</member>
<member name="T:Condition" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\condition.h" line="5">
<summary>
Struct Condition

Following the following grammar rule:
CONDITION = COLUMN OPERATOR LITERAL
</summary>
</member>
<member name="F:Condition.col" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\condition.h" line="13">
<summary>
The column identifier.
</summary>
</member>
<member name="F:Condition.op" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\condition.h" line="18">
<summary>
The operator.
</summary>
</member>
<member name="F:Condition.value" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\condition.h" line="23">
<summary>
The literal vlue.
</summary>
</member>
<member name="M:Condition.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\condition.h" line="28">
<summary>
A default constructor.
</summary>
</member>
<member name="M:Condition.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\condition.h" line="33">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Condition*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\condition.h" line="38">
<summary>
operator&gt;&gt; overload for inputting a Condition.
</summary>
</member>
<member name="T:WhereClause" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\whereClause.h" line="5">
<summary>
Struct WhereClause

Following the following grammar rule:
WHERE_CLAUSE = "WHERE" CONDITION
</summary>
</member>
<member name="F:WhereClause.cond" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\whereClause.h" line="13">
<summary>
A field storing the condition of the WhereClause.
</summary>
</member>
<member name="M:WhereClause.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\whereClause.h" line="18">
<summary>
A default constructor.
</summary>
</member>
<member name="M:WhereClause.#ctor(Condition!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\whereClause.h" line="23">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,WhereClause*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\whereClause.h" line="28">
<summary>
operator&gt;&gt; overload for inputting a WhereClause.
</summary>
</member>
<member name="T:WhereClauses" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\whereClauses.h" line="6">
<summary>
Struct WhereClauses

Following the following grammar rule:
WHERE_CLAUSES = WHERE_CLAUSE [WHERE_CLAUSES]
</summary>
</member>
<member name="F:WhereClauses.whereClauses" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\whereClauses.h" line="14">
<summary>
This fields holds the WhereClause(s).
</summary>
</member>
<member name="M:WhereClauses.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\whereClauses.h" line="19">
<summary>
A default constructor.
</summary>
</member>
<member name="M:WhereClauses.#ctor(std.vector&lt;WhereClause,std.allocator&lt;WhereClause&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\whereClauses.h" line="24">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,WhereClauses*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\whereClauses.h" line="29">
<summary>
operator&gt;&gt; overload for inputting WhereClauses.
</summary>
</member>
<member name="T:OrderByClause" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\orderByClause.h" line="5">
<summary>
Struct OrderByClause

Following the following grammar rule:
ORDER_BY_CLAUSE = "ORDER" "BY" CONDITION
</summary>
</member>
<member name="F:OrderByClause.col" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\orderByClause.h" line="13">
<summary>
The column identifier to order the rows by.
</summary>
</member>
<member name="F:OrderByClause.asc" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\orderByClause.h" line="18">
<summary>
A boolean showing whether the order is ascending (true) or descending (false).
</summary>
</member>
<member name="M:OrderByClause.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\orderByClause.h" line="23">
<summary>
A default constructor.
</summary>
</member>
<member name="M:OrderByClause.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,System.Boolean!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\orderByClause.h" line="28">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,OrderByClause*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\orderByClause.h" line="33">
<summary>
operator&gt;&gt; overload for inputting a OrderByClause.
</summary>
</member>
<member name="T:Query" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="8">
<summary>
Class Query, inherits from Operation.

Following the following rule from the grammar:
QUERY = "SELECT" QUERY_ARGUMENTS "FROM" TABLE [WHERE_CLAUSES] [ORDER_BY_CLAUSE] ";"
</summary>
</member>
<member name="F:Query.queryArguments" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="17">
<summary>
A dynamic field for query arguments - either column identifiers or a set of aggregate functions.
</summary>
</member>
<member name="F:Query.table" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="22">
<summary>
The table identifier.
</summary>
</member>
<member name="F:Query.whereClauses" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="27">
<summary>
Any optional where clauses, could 0, could be more.
</summary>
</member>
<member name="F:Query.orderByClause" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="32">
<summary>
An oprional order by clause.
</summary>
</member>
<member name="M:Query.copy(Query!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="37">
<summary>
A deep copy function.
</summary>
</member>
<member name="M:Query.deallocate" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="42">
<summary>
A function to release dynamic memory.
</summary>
</member>
<member name="M:Query.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="47">
<summary>
A default constructor.
</summary>
</member>
<member name="M:Query.#ctor(QueryArguments*,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,WhereClauses!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,OrderByClause!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="52">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:Query.#ctor(Query!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="57">
<summary>
A copy constructor.
</summary>
</member>
<member name="M:Query.op_Assign(Query!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="62">
<summary>
operator= overload.
</summary>
</member>
<member name="M:Query.eval" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="67">
<summary>
Query evaluation function.
</summary>
</member>
<member name="M:Query.clone" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="72">
<summary>
A clone function.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Query**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="77">
<summary>
operator&gt;&gt; overload for inputting a Query operation.
</summary>
</member>
<member name="M:Query.Dispose" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\query.h" line="82">
<summary>
Query destructor.
</summary>
</member>
<member name="T:ColumnDatatypePairs" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columnDatatypePairs.h" line="7">
<summary>
Struct ColumnDatatypePairs

Following the following grammar rule:
COLUMN_DATATYPE_PAIRS = COLUMN DATATYPE [, COLUMN_DATATYPE_PAIRS]
</summary>
</member>
<member name="F:ColumnDatatypePairs.pairs" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columnDatatypePairs.h" line="15">
<summary>
A vector to hold pairs of column identifier - datatype.
</summary>
</member>
<member name="M:ColumnDatatypePairs.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columnDatatypePairs.h" line="20">
<summary>
A default constructor.
</summary>
</member>
<member name="M:ColumnDatatypePairs.#ctor(std.vector&lt;std.pair&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;&gt;,std.allocator&lt;std.pair&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.R" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columnDatatypePairs.h" line="25">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,ColumnDatatypePairs*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columnDatatypePairs.h" line="30">
<summary>
operator&gt;&gt; overload for inputting ColumnDatatypePairs.
</summary>
</member>
<member name="T:PrimaryKey" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\primaryKey.h" line="5">
<summary>
Struct PrimaryKey

Following the following grammar rule:
PRIMARY_KEY = "PRIMARY" "KEY" COLUMN
</summary>
</member>
<member name="F:PrimaryKey.col" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\primaryKey.h" line="13">
<summary>
The column identifier.
</summary>
</member>
<member name="M:PrimaryKey.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\primaryKey.h" line="18">
<summary>
A default constructor.
</summary>
</member>
<member name="M:PrimaryKey.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\primaryKey.h" line="23">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,PrimaryKey*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\primaryKey.h" line="28">
<summary>
operator&gt;&gt; overload for inputting a PrimaryKey.
</summary>
</member>
<member name="T:CreateTable" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="7">
<summary>
Class CreateTable, inherits Operation.

Following the following grammar rule:
CREATE_TABLE = "CREATE" "TABLE" TABLE "(" COLUMN_DATATYPE_PAIRS ")" [PRIMARY_KEY] ";"
</summary>
</member>
<member name="F:CreateTable.table" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="16">
<summary>
The table identifier.
</summary>
</member>
<member name="F:CreateTable.pairs" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="21">
<summary>
ColumnDatatypePairs field storing, column identifiers and datatypes.
</summary>
</member>
<member name="F:CreateTable.pk" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="26">
<summary>
An optional primary key placeholder.

nullptr = no primary key.
</summary>
</member>
<member name="M:CreateTable.copy(CreateTable!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="33">
<summary>
A deep copy function.
</summary>
<param name=""></param>
</member>
<member name="M:CreateTable.deallocate" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="39">
<summary>
A function to release dynamic memory.
</summary>
</member>
<member name="M:CreateTable.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="44">
<summary>
A default constructor.
</summary>
</member>
<member name="M:CreateTable.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,ColumnDatatypePairs!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,PrimaryKey*)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="48">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:CreateTable.#ctor(CreateTable!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="52">
<summary>
A copy constructor.
</summary>
</member>
<member name="M:CreateTable.op_Assign(CreateTable!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="57">
<summary>
operator= overload.
</summary>
</member>
<member name="M:CreateTable.eval" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="62">
<summary>
CreateTable evaluation function.
</summary>
</member>
<member name="M:CreateTable.clone" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="67">
<summary>
A clone function.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,CreateTable**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="72">
<summary>
operator&gt;&gt; overload for inputting a CreateTable operation.
</summary>
</member>
<member name="M:CreateTable.Dispose" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createTable.h" line="77">
<summary>
CreateTable destructor.
</summary>
</member>
<member name="T:CreateIndex" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createIndex.h" line="6">
<summary>
Class CreateIndex, inherits from Operation.

Following the following rule from the grammar:
CREATE_INDEX = "CREATE" "INDEX" "on" TABLE "(" COLUMN ")" ";"
</summary>
</member>
<member name="F:CreateIndex.table" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createIndex.h" line="15">
<summary>
The table identifier.
</summary>
</member>
<member name="F:CreateIndex.col" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createIndex.h" line="20">
<summary>
A column identifier for the index.
</summary>
</member>
<member name="M:CreateIndex.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createIndex.h" line="25">
<summary>
A default constructor.
</summary>
</member>
<member name="M:CreateIndex.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createIndex.h" line="30">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:CreateIndex.eval" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createIndex.h" line="35">
<summary>
CreateIndex evaluation function.
</summary>
</member>
<member name="M:CreateIndex.clone" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createIndex.h" line="40">
<summary>
A clone function.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,CreateIndex**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\createIndex.h" line="45">
<summary>
operator&gt;&gt; overload for inputting a CreateIndex operation.
</summary>
</member>
<member name="T:AssignOperations" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\assignOperations.h" line="6">
<summary>
Struct AssignOperations

Following the following grammar rule:
ASSIGN_OPERATIONS = COLUMN "=" LITERAL [, ASSIGN_OPERATIONS]
</summary>
</member>
<!-- Discarding badly formed XML document comment for member 'F:AssignOperations.conds'. -->
<member name="M:AssignOperations.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\assignOperations.h" line="21">
<summary>
A default constructor.
</summary>
</member>
<member name="M:AssignOperations.#ctor(std.vector&lt;Condition,std.allocator&lt;Condition&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\assignOperations.h" line="26">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AssignOperations*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\assignOperations.h" line="31">
<summary>
operator&gt;&gt; overload for inputting AssignOperations.
</summary>
</member>
<member name="T:Update" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\update.h" line="8">
<summary>
Class Update, inherits from Operation.

Following the following rule from the grammar:
UPDATE = "UPDATE" TABLE "SET" ASSIGN_OPERATIONS WHERE_CLAUSE ";"
</summary>
</member>
<member name="F:Update.table" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\update.h" line="17">
<summary>
The table identifier.
</summary>
</member>
<!-- Discarding badly formed XML document comment for member 'F:Update.operations'. -->
<member name="F:Update.whereClause" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\update.h" line="27">
<summary>
WhereClause field to store the condition for updating table rows.
</summary>
</member>
<member name="M:Update.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\update.h" line="33">
<summary>
A default constructor.
</summary>
</member>
<member name="M:Update.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,AssignOperations!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,WhereClause!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\update.h" line="38">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:Update.eval" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\update.h" line="43">
<summary>
Update evaluation function.
</summary>
</member>
<member name="M:Update.clone" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\update.h" line="48">
<summary>
A clone function.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Update**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\update.h" line="53">
<summary>
operator&gt;&gt; overload for inputting an Update operation.
</summary>
</member>
<member name="T:Values" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\values.h" line="6">
<summary>
Struct Values

Following the following grammar rule:
VALUES = LITERAL[, VALUES]
</summary>
</member>
<member name="F:Values.literals" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\values.h" line="14">
<summary>
A vector of the stored literals (values).
</summary>
</member>
<member name="M:Values.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\values.h" line="19">
<summary>
A default constructor.
</summary>
</member>
<member name="M:Values.#ctor(std.vector&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,std.allocator&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\values.h" line="24">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Values*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\values.h" line="29">
<summary>
operator&gt;&gt; overload for inputting Values.
</summary>
</member>
<member name="T:InsertInto" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\insertInto.h" line="7">
<summary>
Class InsertInto, inherits Operation.

Following the following grammar rule:
INSERT_INTO = "INSERT" "INTO" TABLE "(" VALUES ")" ";"
</summary>
</member>
<member name="F:InsertInto.table" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\insertInto.h" line="16">
<summary>
The table identifier.
</summary>
</member>
<member name="F:InsertInto.values" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\insertInto.h" line="20">
<summary>
Values field storing the literals to be inserted in the table.
</summary>
</member>
<member name="M:InsertInto.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\insertInto.h" line="26">
<summary>
A default constructor.
</summary>
</member>
<member name="M:InsertInto.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Values!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\insertInto.h" line="31">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:InsertInto.eval" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\insertInto.h" line="36">
<summary>
InsertInto evaluation function.
</summary>
</member>
<member name="M:InsertInto.clone" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\insertInto.h" line="41">
<summary>
A clone function.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,InsertInto**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\insertInto.h" line="46">
<summary>
operator&gt;&gt; overload for inputting a InsertInto operation.
</summary>
</member>
<member name="T:Columns" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columns.h" line="5">
<summary>
Class Columns, inherits from QueryArguments.

Following the following rule from the grammar:
COLUMNS = COLUMN [, COLUMNS]
</summary>
</member>
<member name="F:Columns.cols" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columns.h" line="14">
<summary>
A vector of column identifiers. 

Can include "*".
</summary>
</member>
<member name="M:Columns.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columns.h" line="21">
<summary>
A default constructor.
</summary>
</member>
<member name="M:Columns.#ctor(std.vector&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;,std.allocator&lt;std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;&gt;&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columns.h" line="26">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:Columns.print(Table!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columns.h" line="31">
<summary>
A print function (overriden) to display the columns.
</summary>
<param name="">A Table</param>
</member>
<member name="M:Columns.clone" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columns.h" line="37">
<summary>
A clone function.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Columns**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\columns.h" line="42">
<summary>
operator&gt;&gt; overload for inputting Columns.
</summary>
</member>
<member name="T:Aggregate" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregate.h" line="5">
<summary>
Struct Aggregate

Follows the following grammar rule:
AGGREGATE = AGGREGATE_KEYWORD "(" COLUMN ")"
</summary>
</member>
<member name="F:Aggregate.type" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregate.h" line="13">
<summary>
The aggregate keyword (MIN, MAX, SUM, AVG, COUNT).
</summary>
</member>
<member name="F:Aggregate.col" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregate.h" line="18">
<summary>
The column identifier.
</summary>
</member>
<member name="M:Aggregate.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregate.h" line="23">
<summary>
A default constructor.
</summary>
</member>
<member name="M:Aggregate.#ctor(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregate.h" line="28">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Aggregate*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregate.h" line="33">
<summary>
operator&gt;&gt; overload for inputting an Aggregate.
</summary>
</member>
<member name="T:Aggregates" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregates.h" line="6">
<summary>
Class Aggregates, inherits from QueryArguments.

Following the following rule from the grammar:
AGGREGATES = AGGREGATE [, AGGREGATES]
</summary>
</member>
<member name="F:Aggregates.aggregates" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregates.h" line="15">
<summary>
A vector holding each aggregate.
</summary>
</member>
<member name="M:Aggregates.#ctor" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregates.h" line="21">
<summary>
A default constructor.
</summary>
</member>
<member name="M:Aggregates.#ctor(std.vector&lt;Aggregate,std.allocator&lt;Aggregate&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregates.h" line="26">
<summary>
A parameterized constructor.
</summary>
</member>
<member name="M:Aggregates.print(Table!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregates.h" line="31">
<summary>
A print function (overriden) to display the aggregates.
</summary>
<param name="">A Table</param>
</member>
<member name="M:Aggregates.clone" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregates.h" line="37">
<summary>
A clone function.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Aggregates**!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\aggregates.h" line="42">
<summary>
operator&gt;&gt; overload for inputting Aggregates.
</summary>
</member>
</members>
</doc>