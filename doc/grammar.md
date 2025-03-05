# Helium Grammar #
## Constructs ##

**program** ::= program _**variable_declarations**_<sup>?</sup> _**statements_group**_ .

**statements_group** ::= begin _**statement**_<sup>*</sup> end

**statement** ::= _**return**_ | _**call**_ | 

**return** ::= return (_**expression**_)

**print** ::= print(_**expression**_ [, _**expression**_]<sup>*</sup>)

**call** ::= _**identifier**_(_**expression**_)

**expression** ::= _**literal**_ | _**identifier**_ ; Expression type must match scope's.

**identifier** ::= &lt;undefined&gt;

**literal** ::= _**integer_literal**_ | _**float_literal**_ | _**boolean_literal**_ | _**text_literal**_

**variable_declarations** ::= var (_**identifier**_: _**type**_)<sup>+</sup>

**type** ::= integer | bigint | float | text | boolean

## Semantics ##

### call ###

1. When _**identifier**_ is a variable, then _**expression**_'s result is assigned to that variable.
2. When _**identifier**_ is a function, then the function is called and the final result is stored in RAX register. (not implemented yet)

## print ##

1. When _**identifier**_ is a variable, then call the proper _print\_*_ function from support library.
2. When _**integer_literal**_ then call  _print\_long_.