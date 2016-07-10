$( test file for vim-metamath, with extractions from set.mm
   7-Jul-2016
   http://us.metamath.org/
$)

  $( Declare connectives for disjunction ('or') and conjunction ('and'). $)
  $c \/ $. $( Vee (read:  'or') $)
  wo $a wff ( ph \/ ps ) $.
  $( Theorem *2.53 of [WhiteheadRussell] p. 107.  (Contributed by NM,
     3-Jan-2005.) $)
  pm2.53 $p |- ( ( ph \/ ps ) -> ( -. ph -> ps ) ) $=
    ( wo wn wi df-or biimpi ) ABCADBEABFG $.
    $( [3-Jan-2005] $)

$(
 A comment
$)

  $c qq $.

$(
In vim, you can display the specific syntax type at your
current cursor location by entering:
:echom "> " . synIDattr(synID(line("."),col("."),0),"name")
$)

