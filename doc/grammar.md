# Helium Grammar #
## Program ##

**program** ::= program _**variable_declarations**_<sup>?</sup> _**statements_group**_ .

**statements_group** ::= begin _**statement**_<sup>*</sup> end

**statement** ::= &lt;undefined&gt;

**variable_declarations** ::= var (_**identifier**_: _**type**_)<sup>+</sup>

**type** ::= (integer | bigint | float | text | boolean)