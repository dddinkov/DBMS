<?xml version="1.0"?><doc>
<members>
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
<member name="T:Tokenizer" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="7">
<summary>
A tokenizer class to simplify user input in separate tokens.
</summary>
</member>
<member name="T:Tokenizer.Tokens" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="13">
<summary>
Enumerates the fundamental elements (tokens) of the Tokenizer.
</summary>
</member>
<member name="F:KEYWORD" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="18">
<summary>
Represents keywords.
</summary>
</member>
<member name="F:DATATYPE" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="23">
<summary>
Represents datatypes - int, string, bool, and double.
</summary>
</member>
<member name="F:IDENTIFIER" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="28">
<summary>
Represents identifiers - words containing all letters, the symbol '_', and digits.
An identifier cannot begin with a digit!
</summary>
</member>
<member name="F:LITERAL" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="34">
<summary>
Represents literals - int, string, bool, and double literals.
</summary>
</member>
<member name="F:PUNCTUATION" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="39">
<summary>
Represents punctuation characters - '(', ')', ',', ';'.
</summary>
</member>
<!-- Discarding badly formed XML document comment for member 'F:OPERATOR'. -->
<member name="T:Tokenizer.Token" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="50">
<summary>
Represents the fundamental elements of a tokenizer.
They are called tokens.
</summary>
</member>
<member name="F:Tokenizer.Token.type" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="56">
<summary>
Represents the type of the token.
</summary>
</member>
<member name="F:Tokenizer.Token.value" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="61">
<summary>
Holds the meaning of the token.
</summary>
</member>
<member name="M:Tokenizer.#ctor(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="67">
<summary>
Tokenizer constructor taking input stream object by reference.
</summary>
</member>
<member name="M:Tokenizer.getNextToken" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="72">
<summary>
A Tokenizer function to read the upcoming token from the private field in.
</summary>
</member>
<member name="M:Tokenizer.peek" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="77">
<summary>
A Tokenizer function to peek the next token, without reading it.

The function does not read the token from the private in object, but rather makes a buffer to store the contents of it and read the token from there.
</summary>
</member>
<member name="M:Tokenizer.Dispose" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="84">
<summary>
A Tokenizer destructor to release dynamic fields.

In this case release peeked if it's not released.
</summary>
</member>
<member name="F:Tokenizer.KEYWORDS" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="92">
<summary>
A static array field containing all keywords' values.

They are CREATE, TABLE, PRIMARY, KEY, INSERT, INTO, UPDATE, SET, WHERE, SELECT, FROM, ORDER, BY, ASC, DESC, COUNT, MAX, MIN, AVG, SUM, INDEX, and ON.
</summary>
</member>
<member name="F:Tokenizer.DATATYPES" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="99">
<summary>
A static array field containing all datatypes' values - int, string, bool, and double.
</summary>
</member>
<member name="F:Tokenizer.PUNCTUATION_CHARACTERS" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="104">
<summary>
A static string field containing all punctuation characters.

Actual value - ",();"
</summary>
</member>
<member name="F:Tokenizer.in" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="111">
<summary>
An input stream object from which the tokens will be read from.
</summary>
</member>
<member name="F:Tokenizer.peeked" decl="false" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="116">
<summary>
A dynamic Token field to host the latest peeked token.
</summary>
</member>
<member name="M:Tokenizer.isKeyword(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="121">
<summary>
A static function to identify keywords.
</summary>
</member>
<member name="M:Tokenizer.isIdentifier(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="126">
<summary>
A static function to identify identifiers.
</summary>
</member>
<member name="M:Tokenizer.isLiteral(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="131">
<summary>
A static function to identify literals.

Checks whether the give string is a boolean, string, int, or double literal.
</summary>
</member>
<member name="M:Tokenizer.isBoolLiteral(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="138">
<summary>
A static function to identify boolean literals.


</summary>
</member>
<member name="M:Tokenizer.isStringLiteral(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="145">
<summary>
A static function to identify string literals.

A string is defined by being enclosed in double quotes ("").
\" and \\ are allowed as escaped characters.
</summary>
</member>
<member name="M:Tokenizer.isIntLiteral(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="153">
<summary>
A static function to identify int literals.
</summary>
</member>
<member name="M:Tokenizer.isDoubleLiteral(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="158">
<summary>
A static function to identify double literals.

Int literals are also considered double literals.
-.0, .0 are also considered valid double literals.
</summary>
</member>
<member name="M:Tokenizer.isDatatype(std.basic_string&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte},std.allocator&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte&gt;&gt;!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="166">
<summary>
A static function to identify datatypes.

The actual words - int, string, bool, and double.
</summary>
</member>
<member name="M:op_RightShift(std.basic_istream&lt;System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}&gt;*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Tokenizer.Token*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)" decl="true" source="C:\Users\ACER\Desktop\school\FMI-CS\3 s\SDP\DBMS\DBMS\Tokenizer.h" line="173">
<summary>
A Tokenizer-friendly overload for operator&gt;&gt; for inputting a token from istream object.

Throws exceptions on unspecified tokens.
</summary>
</member>
<!-- Discarding badly formed XML document comment for member 'M:op_LeftShift(std.basic_ostream<System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte,std.char_traits{System.SByte!System.Runtime.CompilerServices.IsSignUnspecifiedByte}>*!System.Runtime.CompilerServices.IsImplicitlyDereferenced,Tokenizer.Token!System.Runtime.CompilerServices.IsConst*!System.Runtime.CompilerServices.IsImplicitlyDereferenced)'. -->
</members>
</doc>