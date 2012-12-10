Alexpass
========

A *Ruby gem for generating passwords* derived from *hand-alternating*, *visually unambiguous*, *alphanumeric characters*.

Example
-------

`nXH3ix9w`

General Characteristics
-----------------------

 * alternates hands (currently only supports `QWERTY` [keyboard layout](http://en.wikipedia.org/wiki/Keyboard_layout))
 * always starts with a lower-case character (left-hand first for odd-length passwords; right if even)
 * always ends with a left-hand character (so that the right-hand can finalize the hand alternation by hitting `Enter`/`Return`)
 * all characters are alphanumeric; there are no symbols (so the passwords highlight when double-clicked)
 * all characters are visually unambigous (some fonts make it difficult/impossible to distinguish *zero* and *capital 'o'*, or *one* and *lowercase 'L'*, and *uppercase i*, etc. so such characters are purposely not used)

The "memorizable" pattern
-------------------------

 * the "memorizable" pattern is: lower, UPPER, UPPER, *number*, lower, lower, *number*, lower
 * this pattern repeats for longer passwords

At a glance, a password such as `nXH3ix9w` looks incredibly difficult to memorize, but practicing it 5-10 times usually does the trick, particularly after first taking note of the pattern.

Options
-------

 * make passwords of any *length* (`:length => [0-9]+`)
 * use the *memorizable* pattern or not (`:memorizable => true|false`)
 * show the sample sets and number of *permutations* (`:permutations => [vvv]`) (more `v`'s increase verbosity)

Defaults
--------

 * `:length => 8`
 * `:memorizable => true`

Examples
--------

Return a *default* password:

    Alexpass.generate
     => "uGL4ox7f"

Return an *odd-length* password, not using the memorizable pattern:

    Alexpass.generate(:length => 15, :memorizable => false)
     => "cH5L3jwyw9XPw8V"

Return an *even-length* password, not using the memorizable pattern:

    Alexpass.generate(:length => 16, :memorizable => false)
     => "uV7AhspqySkBUwhs"

Return the *number of permutations*:

    Alexpass.permutations(:length => 16, :memorizable => false)
     => 2869959681148181529600

Print the *sample sets* and *permutation calculation* of a default password, and return the *number of permutations*:

    Alexpass.permutations(:length => 8, :memorizable => true, :permutations => 'vvv')
    sample sets:
    ["y", "u", "i", "o", "p", "h", "j", "k", "n", "m"]
    ["Q", "W", "E", "R", "T", "A", "S", "D", "F", "G", "Z", "X", "C", "V", "B"]
    ["Y", "U", "P", "H", "J", "K", "L", "N", "M"]
    ["2", "3", "4", "5"]
    ["y", "u", "i", "o", "p", "h", "j", "k", "n", "m"]
    ["q", "w", "e", "r", "t", "a", "s", "d", "f", "g", "z", "x", "c", "v"]
    ["7", "8", "9"]
    ["q", "w", "e", "r", "t", "a", "s", "d", "f", "g", "z", "x", "c", "v"]
    10 * 15 * 9 * 4 * 10 * 14 * 3 * 14 permutations
     => 31752000

Companion Command-Line Tool
---------------------------

Get it here: https://github.com/abatko/alexpass.rb

