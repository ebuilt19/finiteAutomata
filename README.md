# finiteAutomata
"a function
accept :: [(Integer, Char, Integer)] -> [Integer] -> [Char] -> Bool
that receives a list of state transitions, a list of accepting states, and an input string and
tells us whether the given DFA accepts the input string. By default, the starting state is
always state 1. For example, consider the following DFA with accepting state 4:
abaaMachine = [(1, 'a', 2), (2, 'a', 3), (2, 'b', 2), (3, 'a', 4)]
This machine accepts any string that starts with an ‘a’ followed by any number (zero or
more) of ‘b’s and finally the substring ‘aa’. Consequently, your program should give the
following outputs:
*Main> accept abaaMachine [4] "abbbaa"
True
*Main> accept abaaMachine [4] "abbba"
False
*Main> accept abaaMachine [4] "aabaa"
False
*Main> accept abaaMachine [4] "aaa"
True"
