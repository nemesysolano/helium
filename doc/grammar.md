# Helium Grammar #
## Program ##

**program** ::= program _**variable_declarations**_<sup>?</sup> _**statements_group**_ .

**statements_group** ::= begin _**statement**_<sup>*</sup> end

**statement** ::= _**return**_

**return** ::= return (_**expression**_)

**expression** ::= _**literal**_ | _**identifier**_ ; Expression type must match scope's.

**identifier** ::= &lt;undefined&gt;

**literal** ::= _**integer_literal**_ | _**float_literal**_ | _**boolean_literal**_ | _**text_literal**_

**variable_declarations** ::= var (_**identifier**_: _**type**_)<sup>+</sup>

**type** ::= integer | bigint | float | text | boolean