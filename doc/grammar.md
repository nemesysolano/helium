# Helium Grammar #
## Constructs ##

**program** ::= program _**variable_declarations**_<sup>?</sup> _**statements_group**_ .

**statements_group** ::= begin _**statement**_<sup>*</sup> end

**statement** ::= _**return**_ | _**call**

**return** ::= return (_**expression**_)

**call** ::= _**identifier**_(_**expression**_); SCRUM-1

**expression** ::= _**literal**_ | _**identifier**_ ; Expression type must match scope's.

**identifier** ::= &lt;undefined&gt;

**literal** ::= _**integer_literal**_ | _**float_literal**_ | _**boolean_literal**_ | _**text_literal**_

**variable_declarations** ::= var (_**identifier**_: _**type**_)<sup>+</sup>

**type** ::= integer | bigint | float | text | boolean

## Semantics ##

### call ###

1. When _**identifier**_ is a variable, then _**expression**_'s result is assigned to that variable.; (SCRUM-2)
2. When _**identifier**_ is a function, then the function is called and the final result is stored in RAX register.