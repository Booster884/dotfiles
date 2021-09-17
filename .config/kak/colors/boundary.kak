# Boundary theme
# Heavily inspired by and pretty much all colours taken from
# https://github.com/jolaleye/horizon-theme-vscode

evaluate-commands %sh{
    #black="rgb:16161c"
    black="rgb:0b0b0e"
    dark_gray="rgb:1c1e26"
    gray="rgb:2e303e"
    white="rgb:fdf0ed"

    pink="rgb:de87bc"
    purple="rgb:b877db"
    blue="rgb:6c6f93"
    cyan="rgb:25b2bc"
    green="rgb:27d796"
    yellow="rgb:fac29a"
    orange="rgb:f09383"
    red="rgb:f43e5c"

    echo "
        face global value $orange
        face global type $purple
        face global variable $red
        face global function $cyan
        face global module $yellow
        face global string $yellow
        face global error $red
        face global keyword $purple
        face global operator $orange
        face global attribute $pink
        face global comment $gray+i
        face global meta $yellow
        face global builtin $white+b

        # Necessary?
        face global title $red
        face global header $orange
        face global mono $green
        face global block $cyan
        face global link $green
        face global bullet $green
        face global list $white

        face global Default $white,$black

        face global PrimarySelection $yellow,$dark_gray
        face global PrimaryCursor $black,$white
        face global PrimaryCursorEol $black,$white

        face global SecondarySelection $yellow,$dark_gray
        face global SecondaryCursor $black,$orange
        face global SecondaryCursorEol $black,$orange

        face global MatchingChar $black,$blue
        face global Search $blue,$green
        face global CurrentWord $white,$blue

        face global Whitespace $gray,$black+f
        face global BufferPadding $gray,$black
        # must use wrap -marker hl
        face global WrapMarker Whitespace

        face global LineNumbers $gray,$black+b
        # must use -hl-cursor
        face global LineNumberCursor $white,$gray+b
        face global LineNumbersWrapped $gray,$black+i

        face global MenuBackground $white,$blue
        face global MenuForeground $blue,$white+b
        face global MenuInfo $cyan,$blue
        face global Information $yellow,$gray
        face global Error $black,$red

        face global StatusLine $white,$black
        face global StatusLineMode $black,$green
        face global StatusLineInfo $purple,$black
        face global StatusLineValue $orange,$black
        face global StatusCursor $white,$blue
        face global Prompt $black,$green
    "
}
