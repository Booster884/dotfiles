# Hadron theme

evaluate-commands %sh{
    black="rgb:101211"
    gray="rgb:8f9c99"
    dark_gray="rgb:404b4d"
    white="rgb:f7f0f1"

    pink="rgb:de87bc"
    purple="rgb:8756a6"
    blue="rgb:1e5beb"
    cyan="rgb:63dbd6"
    green="rgb:35d46a"
    yellow="rgb:f0c735"
    orange="rgb:e07528"
    red="rgb:f04329"

    dark_pink="rgb:de87bc"
    dark_purple="rgb:8756a6"
    dark_blue="rgb:1e5beb"
    dark_cyan="rgb:2a959c"
    dark_green="rgb:35d46a"
    dark_yellow="rgb:f0c735"
    dark_orange="rgb:e07528"
    dark_red="rgb:f04329"

    echo "
         face global value $green
         face global type $purple
         face global variable $red
         face global function $red
         face global module $red
         face global string $yellow
         face global error $red
         face global keyword $blue
         face global operator $orange
         face global attribute $pink
         face global comment $dark_gray+i
         face global meta $red
         face global builtin $white+b

         face global title $red
         face global header $orange
         face global mono $green
         face global block $cyan
         face global link $green
         face global bullet $green
         face global list $white

         face global Default $white,$black

         face global PrimarySelection $black,$dark_cyan
         face global PrimaryCursorEol $black,$white
         face global PrimaryCursor $black,$white

         face global SecondarySelection $black,$purple
         face global SecondaryCursor $black,$orange
         face global SecondaryCursorEol $black,$orange

         face global MatchingChar $black,$blue
         face global Search $blue,$green
         face global CurrentWord $white,$blue

         # listchars
         face global Whitespace $gray,$black+f
         # ~ lines at EOB
         face global BufferPadding $gray,$black
         # must use wrap -marker hl
         face global WrapMarker Whitespace

         face global LineNumbers $gray,$black
         # must use -hl-cursor
         face global LineNumberCursor $white,$gray+b
         face global LineNumbersWrapped $gray,$black+i

         # when item focused in menu
         face global MenuForeground $blue,$white+b
         # default bottom menu and autocomplete
         face global MenuBackground $white,$blue
         # complement in autocomplete like path
         face global MenuInfo $cyan,$blue
         # clippy
         face global Information $yellow,$gray
         face global Error $black,$red

         # all status line: what we type, but also client@[session]
         face global StatusLine $white,$black
         # insert mode, prompt mode
         face global StatusLineMode $black,$green
         # message like '1 sel'
         face global StatusLineInfo $purple,$black
         # count
         face global StatusLineValue $orange,$black
         face global StatusCursor $white,$blue
         # like the word 'select:' when pressing 's'
         face global Prompt $black,$green
    "
}
