<?xml version="1.0"?><doc>
<members>
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