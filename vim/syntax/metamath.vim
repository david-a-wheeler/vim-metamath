" Vim syntax file
" Language: Metamath
" Maintainer: David A. Wheeler <dwheeler@dwheeler.com>
" Latest Revision: 5 July 2016

if exists("b:current_syntax")
  finish
endif

syn case match

" Synchronize display on the last-seen comment closer, for speed.
syn sync match metamathSyncComment grouphere NONE " $)"

" Whitespace and newlines delimit nearly everything.
" Identifiers can contain "." and "$"; parentheses are valid constants.
setlocal iskeyword=33-255

" Handle special constructs within a comment.

" A cross-reference in a comment; begins with "~".
syn region metamathXref contained
    \ start="\<\~ \+"
    \ end="\>"

" An expression in a comment; enclosed by `...`.
syn region metamathEmbeddedExpression contained
    \ start="`"
    \ end="`\( \|$\)"he=e-1
    \ contains=@metamathExpression
    \ skip="``"

" An date in a comment; these are common enough to visually distinguish.
syn match metamathDate contained
    \ '\([1-2][0-9]\|3[0-1]\|[1-9]\)-[A-Z][a-z][a-z]-[1-9][0-9][0-9][0-9]'

syn keyword metamathTodo contained TODO FIXME Todo

syn match metamathDiscouraged contained
    \ "\((Proof modification is discouraged.)\|(New usage is discouraged.)\)"

" External bibliography reference.  See "help write bibliography"
" in the metamath C program, which says:
"  A name in square brackets in a statement's description (the comment before
"  a $a or $p statement) indicates a bibliographic reference. The full
"  reference must be of the form
"      <keyword> <identifier> <noise word(s)> [<author>] p. <nnn>
"  There should be no comma between "[<author>]" and "p.".
"  Whitespace, comma, period, or semicolon should follow <nnn>.
"  Example:
"  Theorem 3.1 of [Monk] p. 22,
"  The <keyword>, which is not case-sensitive,
"  must be one of the following: Axiom, Chapter, Compare, Condition,
"  Corollary, Definition, Equation, Example, Exercise, Figure, Item,
"  Lemma, Lemmas, Line, Lines, Notation, Part, Postulate, Problem, Property,
"  Proposition, Remark, Rule, Scheme, Section, Theorem.
"  The <identifier> is optional, as in for example
"  "Remark in [Monk] p. 22".
"  The <noise word(s)> are zero or more from the list: from, in, of, on.
"  These are ignored when
"  generating the bibliographic cross-reference. The <author> must be present
"  in the file identified with the htmlbibliography assignment (e.g.
"  mmset.html) in the database $t comment, in the form <A NAME="<author>"></A>
"  e.g. <A NAME="Monk"></A>. The <nnn> may be any alphanumeric string such as
"  an integer or Roman numeral.
syn match metamathBibReference contained
  \ "\(Axiom\|Chapter\|Compare\|Condition\|\|Corollary\|Definition\|Equation\|Example\|Exercise\|Figure\|Item\|Lemmas\?\|Lines\?\|Notation\|Part\|Postulate\|Problem\|Property\|Proposition\|Remark\|Rule\|Scheme\|Section\|Theorem\)[ \t\n\r]\+\([^\t\n\r]\{1,10\}[ \t\n\r]\+\)\?\(\(from\|in\|of\|on\)[ \t\n\r]\+\)\?\[[^ \t\n\r\[\]]*\][ \t\n\r]\+p\.[ \t\n\r]\+[^ \t\n\r]\+"

" Some text within a comment is special; this cluster lists them.
syn cluster metamathSpecialComment
    \ contains=metamathXref,metamathEmbeddedExpression,metamathDate,metamathTodo,metamathDiscouraged,metamathBibReference


" metamathComments do NOT nest, so we use keepend.
" Could be a stickler for the
" legal characters: A-Z, a-z, 0-9, and:
" ` ~ ! @ # $ % ^ & * ( ) - _ = +
" [ ] { } ; : ' " , . < > / ? \ |

syn region metamathComment
    \ start="$("hs=s+1
    \ end="$)"he=e-1
    \ contains=@metamathSpecialComment,@Spell
    \ conceal keepend

" $c ... $. - Constant declaration
syn region metamathConstant
    \ start="$c "hs=s+3
    \ end=" $\."he=e-3

" $v ... $. - Variable declaration
syn region metamathVariable
    \ start="$v "hs=s+3
    \ end=" $\."he=e-3

" $d ... $. - Disjoint (distinct) variable restriction
syn region metamathDisjoint
    \ start="$d "hs=s+3
    \ end=" $\."he=e-3

" <label> $f ... $. - "Floating" hypothesis (i.e. variable type declaration)
syn region metamathFloating
    \ start="$f "hs=s+3
    \ end=" $\."he=e-3

" <label> $e ... $. - "Essential" hypothesis (i.e. a logical assumption for a
"                     theorem or axiom)
syn region metamathEssential
       \ start="$e "hs=s+3
       \ end=" $\."he=e-3
       \ contains=@metamathExpression

" <label> $a ... $. - Axiom or definition or syntax construction
syn region metamathAxiom
       \ start="$a "hs=s+3
       \ end=" $\."he=e-3
       \ contains=@metamathExpression

" <label> $p ... $= ... $. - Theorem and its proof.
" This handles the first part before "$="; on "$=" we start "metamathProof",
" which looks different. The "keepend" is needed to end with metamathProof.
syn region metamathTheorem
       \ start="$p "hs=s+3
       \ end="$\."he=e-2
       \ contains=metamathProof,@metamathExpression
       \ keepend

" This is the proof part of a theorem.
syn region metamathProof
       \ start=" $="hs=s+3
       \ end="$\."
       \ contained

" $[ ... $] - Include a file
syn region metamathInclude
       \ start="$\[ "hs=s+3
       \ end=" $\]"he=e-3

syn match metamathLabel "[A-Za-z0-9_.-]\+"

" Trailing space is bad for version control - warn about it.
syn match metamathTrailingspace "[ \t]*$"

" Technically metamath doesn't "know" about specific constants.
" However, typical metamath files define some specific constants as operators,
" and they are unlikely to have unexpected meanings,
" so let's recognize them.
" TODO: Make this matching optional.
syn cluster metamathExpression
    \ contains=metamathNumber,metamathBoolean,metamathBasicOperator

syn match metamathNumber contained '\<\d\+\>'
syn keyword metamathBoolean contained T.
syn keyword metamathBoolean contained F.
syn keyword metamathBasicOperator contained ->
syn keyword metamathBasicOperator contained <->
syn keyword metamathBasicOperator contained -.
syn keyword metamathBasicOperator contained (
syn keyword metamathBasicOperator contained )
syn keyword metamathBasicOperator contained \|-
syn keyword metamathBasicOperator contained \\/
syn keyword metamathBasicOperator contained /\
syn keyword metamathBasicOperator contained A.
syn keyword metamathBasicOperator contained E.
syn keyword metamathBasicOperator contained e.
syn keyword metamathBasicOperator contained =


let b:current_syntax = "metamath"

" Define highlighting.  The "standard" names don't map well
" to metamath constructs; this mapping probably needs work.
" For list see http://vimdoc.sourceforge.net/htmldoc/syntax.html#:highlight
highlight def link metamathComment     Comment
highlight def link metamathXref        Underlined
highlight def link metamathDate        SpecialComment
highlight def link metamathDiscouraged SpecialComment
highlight def link metamathEmbeddedExpression Structure
highlight def link metamathBibReference SpecialComment
highlight def link metamathTodo        Todo

highlight def link metamathConstant    Constant
highlight def link metamathVariable    Constant
highlight def link metamathDisjoint    Statement
highlight def link metamathFloating    Statement
highlight def link metamathEssential   Statement
highlight def link metamathAxiom       Statement
highlight def link metamathTheorem     Structure
highlight def link metamathProof       Define
highlight def link metamathInclude     Include
highlight def link metamathTrailingspace Error
highlight def link metamathLabel       Identifier

highlight def link metamathBoolean     Boolean
highlight def link metamathNumber      Number
highlight def link metamathBasicOperator Constant

