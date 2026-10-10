# sml spec

## Keywords
```
-- Control flow
if
lif
els
whl
for
end

ret
brk
con

-- Types
bol
int
str
flt
nil

fun
rec
typ

-- Scope specifiers
loc
glb
```

## EBNF
```ebnf
program = { stmt } ;

block = { stmt }, "end" ;

(* Control flow *)
stmt = var-declaration
	| var-assignation
	| if-stmt
	| whl-stmt
	| for-stmt
	| ret-stmt
	| brk-stmt
	| con-stmt;

if-stmt = "if", expr, { stmt },
	{ "lif", expr, { stmt } },
	[ "els", { stmt } ],
	"end" ;
whl-stmt = "whl", expr, block ;
for-stmt = "for", expr, block ;
ret-stmt = "ret", [ expr ] ;
brk-stmt = "brk", [ expr ] ;
con-stmt = "con", [ expr ] ;

(* Variables *)
scope-specifier = "loc" | "glb" ;
var-declaration = scope-specifier, ident, ":", expr, "=", expr ;
var-assignation = ident, "=", expr ;

(* Functions *)
params = param, { ",", param } ;
param = ident, ":", expr ;

(* Expressions *)
expr = or-expr ;
or-expr = and-expr, { "or", and-expr } ;
and-expr = cmp-expr, { "and", cmp-expr } ;
cmp-expr = add-expr, { ( "==" | "!=" | "<" | ">" | "<=" | ">=" ), add-expr } ;
add-expr = mul-expr, { ( "+" | "-" ), mul-expr } ;
mul-expr = unary, { ( "*" | "/" | "%" ), unary } ;
unary = [ "-" | "not" ], primary ;
primary = literal | ident | call | "(", expr, ")" ;
call = ident, "(", [ expr, { ",", expr } ], ")" ;
```

```ebnf