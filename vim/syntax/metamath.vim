" Vim syntax file
" Language: Metamath
" Maintainer: David A. Wheeler <dwheeler@dwheeler.com>
" Latest Revision: 7 July 2016
" Metamath is a tiny language that can express theorems in abstract
" mathematics, accompanied by proofs that can be verified by a computer
" program with absolute rigor. For more info see: http://metamath.org/

if exists('b:current_syntax')
  finish
endif

syn case match

" Synchronize display on the last-seen comment closer, for speed.
syn sync match metamathSyncComment grouphere NONE '\<$)\>'

" Whitespace and newlines delimit nearly everything.
" Identifiers can contain '.' and '$'; parentheses are valid constants.
setlocal iskeyword=33-255

" Highlight $.. commands that don't match anything else.
syn match metamathBadStatement '$[^ {}]'

" Handle special constructs within a comment.

" A cross-reference in a comment; begins with '~'.
syn region metamathXref contained
    \ start='\<\~ \+'
    \ end='\>'

" An expression in a comment; enclosed by `...` (backquotes).
syn region metamathEmbeddedExpression contained
    \ start='\<"\?`\>'
    \ end='\<`\>'
    \ contains=@metamathExpression
    \ skip='``'

" An date in a comment; these are common enough to visually distinguish.
syn match metamathDate contained
    \ '\([1-2][0-9]\|3[0-1]\|[1-9]\)-[A-Z][a-z][a-z]-[1-9][0-9][0-9][0-9]'

syn keyword metamathTodo contained TODO FIXME Todo

syn match metamathDiscouraged contained
    \ '\((Proof modification is discouraged.)\|(New usage is discouraged.)\)'

" External bibliography reference.  See 'help write bibliography'
" in the metamath C program, which says:
"  A name in square brackets in a statement's description (the comment before
"  a $a or $p statement) indicates a bibliographic reference. The full
"  reference must be of the form
"      <keyword> <identifier> <noise word(s)> [<author>] p. <nnn>
"  There should be no comma between '[<author>]' and 'p.'.
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
  \ '\c\(Axiom\|Chapter\|Compare\|Condition\|\|Corollary\|Definition\|Equation\|Example\|Exercise\|Figure\|Item\|Lemmas\?\|Lines\?\|Notation\|Part\|Postulate\|Problem\|Property\|Proposition\|Remark\|Rule\|Scheme\|Section\|Theorem\)[ \t\n\r]\+\([^\t\n\r]\{1,10\}[ \t\n\r]\+\)\?\(\(from\|in\|of\|on\)[ \t\n\r]\+\)\?\[[^ \t\n\r\[\]]*\][ \t\n\r]\+p\.[ \t\n\r]\+[^ \t\n\r]\+'

syn match metamathURL contained
    \ '\<https\?://[^ \t]\+\>'

" Specially match long-standing bugs in the introductory set.mm comments
" (they're not as critical because it's never rendered).
syn match metamathSetMMBug contained
    \ '\(changed \"D e\. Met\" to \"D e\. ( Met ` X )\",\|revised ( ( fLim ` J ) ` F ) -> ( J fLim F )\|is interpreted as a single ` \.  A special\|\"( f ` x )\" should be read \"the value of function f at x\"\)'

" Highlight characters other than the officially
" legal characters (per spec), which are A-Z, a-z, 0-9, and:
" ` ~ ! @ # $ % ^ & * ( ) - _ = +
" [ ] { } ; : ' " , . < > / ? \ |
syn match metamathIllegalChar contained
  \ '[^A-Za-z0-9`~!@#$%^&*()_=+\[\]{};:'\",.<>/?\\| \t\n\r\f-]'

" Some text within a comment is special; this cluster lists them.
syn cluster metamathSpecialComment
    \ contains=metamathXref,metamathEmbeddedExpression,metamathDate,metamathTodo,metamathDiscouraged,metamathBibReference,metamathURL,metamathSetMMBug,metamathIllegalChar


" metamathComments do NOT nest, so we use keepend.
syn region metamathComment
    \ start='\<$(\>'
    \ end='\<$)\>'
    \ contains=metamathTrailingSpace,@metamathSpecialComment,@Spell
    \ conceal keepend

" $c ... $. - Constant declaration
syn region metamathConstant
    \ start='\<$c\>'
    \ end='\<$\.\>'

" $v ... $. - Variable declaration
syn region metamathVariable
    \ start='\<$v\>'
    \ end='\<$\.\>'

" $d ... $. - Disjoint (distinct) variable restriction
syn region metamathDisjoint
    \ start='\<$d\>'
    \ end='\<$\.\>'

" The following constructs require labels, so require that the label
" be processed first.

" <label> $f ... $. - "Floating" hypothesis (i.e. variable type declaration)
syn region metamathFloating contained
    \ start='\<$f\>'
    \ end='\<$\.\>'

" <label> $e ... $. - "Essential" hypothesis (i.e. a logical assumption for a
"                     theorem or axiom)
syn region metamathEssential contained
       \ start='\<$e\>'
       \ end='\<$\.\>'
       \ contains=@metamathExpression

" <label> $a ... $. - Axiom or definition or syntax construction
syn region metamathAxiom contained
       \ start='\<$a\>'
       \ end='\<$\.\>'
       \ contains=@metamathExpression

" <label> $p ... $= ... $. - Theorem and its proof.
" This handles the first part before "$="; on "$=" we start "metamathProof",
" which looks different. The "keepend" is needed to end with metamathProof.
syn region metamathTheorem contained
       \ start='\<$p\>'
       \ end='\<$\.\>'
       \ contains=metamathProof,@metamathExpression
       \ keepend

" This is the proof part of a theorem.
syn region metamathProof contained
       \ start='\<$=\>'
       \ end='\<$\.\>'
       \ contains=metamathTrailingSpace

" $[ ... $] - Include a file
syn region metamathInclude
       \ start='\<$\[\>'
       \ end='\<$\]\>'

" ${ ... $} - Block
syn region metamathBlock
       \ start='${'
       \ end='$}'
       \ contains=TOP
       \ transparent

" Highlight lables, and then handle labelled constructs (but only when
" the required label is there).
syn cluster metamathLabelled
    \ contains=metamathFloating,metamathEssential,metamathAxiom,metamathTheorem,metamathProof

syn match metamathLabel '\<[A-Za-z0-9_.-]\+\>'
    \ nextgroup=@metamathLabelled
    \ skipwhite skipempty

" Trailing space is bad for version control - warn about it.
syn match metamathTrailingSpace '[ \t]\+$'

" Technically metamath doesn't "know" about specific constants in
" math expressions.  Even parentheses must be defined.
" However, typical metamath files define some specific common constructs
" constants as numbers, parentheses, turnstile,
" fundamental logical operators, and so on.
" They are unlikely to have unexpected meanings.
" So let's recognize them, emphasizing those very low-level constructs.
" This provides some contrast with other parts of an expression,
" and the visual contrast can help the eye notice a defect.
" If you don't want to recognize these, set "metamath_omit_common".
if !exists('g:metamath_omit_common')
  syn match metamathNumber contained '\<\d\+\>'
  syn keyword metamathBoolean contained T.
  syn keyword metamathBoolean contained F.
  syn keyword metamathBasicOperator contained \|-
  syn keyword metamathBasicOperator contained ->
  syn keyword metamathBasicOperator contained <->
  syn keyword metamathBasicOperator contained -.
  syn keyword metamathBasicOperator contained (
  syn keyword metamathBasicOperator contained )
  syn keyword metamathBasicOperator contained \\/
  syn keyword metamathBasicOperator contained /\
  syn keyword metamathBasicOperator contained A.
  syn keyword metamathBasicOperator contained E.
  syn keyword metamathBasicOperator contained e.
  syn keyword metamathBasicOperator contained =
endif

syn cluster metamathExpression
    \ contains=metamathNumber,metamathBoolean,metamathBasicOperator,metamathTrailingSpace

let b:current_syntax = 'metamath'

" Define highlighting.  The "standard" names don't map well
" to metamath constructs; this mapping probably needs work.
" For list see http://vimdoc.sourceforge.net/htmldoc/syntax.html#:highlight
highlight def link metamathBadStatement Error
highlight def link metamathComment     Comment
highlight def link metamathXref        Underlined
highlight def link metamathURL         Underlined
highlight def link metamathDate        SpecialComment
highlight def link metamathDiscouraged SpecialComment
highlight def link metamathEmbeddedExpression Structure " metamathTheorem
highlight def link metamathBibReference SpecialComment
highlight def link metamathSetMMBug    Error
highlight def link metamathIllegalChar Error
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
highlight def link metamathTrailingSpace Error
highlight def link metamathLabel       Label

highlight def link metamathBoolean     Boolean
highlight def link metamathNumber      Number
highlight def link metamathBasicOperator Constant

