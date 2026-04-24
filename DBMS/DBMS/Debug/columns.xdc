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
<member name="T:Tokenizer" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="7">
<summary>
A tokenizer class to simplify user input in separate tokens.
</summary>
</member>
<member name="T:Tokenizer.Tokens" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="13">
<summary>
Enumerates the fundamental elements (tokens) of the Tokenizer.
</summary>
</member>
<member name="F:KEYWORD" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="18">
<summary>
Represents keywords.
</summary>
</member>
<member name="F:DATATYPE" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="23">
<summary>
Represents datatypes - int, string, bool, and double.
</summary>
</member>
<member name="F:IDENTIFIER" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="28">
<summary>
Represents identifiers - words containing all letters, the symbol '_', and digits.
An identifier cannot begin with a digit!
</summary>
</member>
<member name="F:LITERAL" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="34">
<summary>
Represents literals - int, string, bool, and double literals.
</summary>
</member>
<member name="F:PUNCTUATION" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="39">
<summary>
Represents punctuation characters - '(', ')', ',', ';'.
</summary>
</member>
<!-- Discarding badly formed XML document comment for member 'F:OPERATOR'. -->
<member name="T:Tokenizer.Token" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="50">
<summary>
Represents the fundamental elements of a tokenizer.
They are called tokens.
</summary>
</member>
<member name="F:Tokenizer.Token.type" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="56">
<summary>
Represents the type of the token.
</summary>
</member>
<member name="F:Tokenizer.Token.value" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="61">
<summary>
Holds the meaning of the token.
</summary>
</member>
<member name="M:Tokenizer.#ctor(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="67">
<summary>
Tokenizer constructor taking input stream object by reference.
</summary>
</member>
<member name="M:Tokenizer.getNextToken" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="72">
<summary>
A Tokenizer function to read the upcoming token from the private field in.
</summary>
</member>
<member name="M:Tokenizer.peek" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="77">
<summary>
A Tokenizer function to peek the next token, without reading it.

The function does not read the token from the private in object, but rather makes a buffer to store the contents of it and read the token from there.
</summary>
</member>
<member name="M:Tokenizer.Dispose" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="84">
<summary>
A Tokenizer destructor to release dynamic fields.

In this case release peeked if it's not released.
</summary>
</member>
<member name="F:Tokenizer.KEYWORDS" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="92">
<summary>
A static array field containing all keywords' values.

They are CREATE, TABLE, PRIMARY, KEY, INSERT, INTO, UPDATE, SET, WHERE, SELECT, FROM, ORDER, BY, ASC, DESC, COUNT, MAX, MIN, AVG, SUM, INDEX, and ON.
</summary>
</member>
<member name="F:Tokenizer.DATATYPES" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="99">
<summary>
A static array field containing all datatypes' values - int, string, bool, and double.
</summary>
</member>
<member name="F:Tokenizer.PUNCTUATION_CHARACTERS" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="104">
<summary>
A static string field containing all punctuation characters.

Actual value - ",();"
</summary>
</member>
<member name="F:Tokenizer.in" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="111">
<summary>
An input stream object from which the tokens will be read from.
</summary>
</member>
<member name="F:Tokenizer.peeked" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="116">
<summary>
A dynamic Token field to host the latest peeked token.
</summary>
</member>
<member name="M:Tokenizer.isKeyword(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="121">
<summary>
A static function to identify keywords.
</summary>
</member>
<member name="M:Tokenizer.isIdentifier(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="126">
<summary>
A static function to identify identifiers.
</summary>
</member>
<member name="M:Tokenizer.isLiteral(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="131">
<summary>
A static function to identify literals.

Checks whether the give string is a boolean, string, int, or double literal.
</summary>
</member>
<member name="M:Tokenizer.isBoolLiteral(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="138">
<summary>
A static function to identify boolean literals.


</summary>
</member>
<member name="M:Tokenizer.isStringLiteral(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="145">
<summary>
A static function to identify string literals.

A string is defined by being enclosed in double quotes ("").
\" and \\ are allowed as escaped characters.
</summary>
</member>
<member name="M:Tokenizer.isIntLiteral(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="153">
<summary>
A static function to identify int literals.
</summary>
</member>
<member name="M:Tokenizer.isDoubleLiteral(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="158">
<summary>
A static function to identify double literals.

Int literals are also considered double literals.
-.0, .0 are also considered valid double literals.
</summary>
</member>
<member name="M:Tokenizer.isDatatype(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="166">
<summary>
A static function to identify datatypes.

The actual words - int, string, bool, and double.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Tokenizer.Token*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\tokenizer.h" line="173">
<summary>
A Tokenizer-friendly overload for operator&gt;&gt; for inputting a token from istream object.

Throws exceptions on unspecified tokens.
</summary>
</member>
<!-- Discarding badly formed XML document comment for member 'M:op_LeftShift(std.basic_ostream<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}>*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Tokenizer.Token!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
</members>
</doc>