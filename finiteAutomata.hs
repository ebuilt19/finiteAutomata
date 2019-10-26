-------------------------------Finite Automata---------------------------------
getCurrState :: (Integer,Char,Integer) -> Integer
getCurrState (a,_,_) = a

getVal :: (Integer,Char,Integer) -> Char
getVal (_,b,_) = b

getTargetState :: (Integer,Char,Integer) -> Integer
getTargetState (_,_,c) = c

--returns the machine that have the same start state as the last target state
checkTargetState :: Integer ->
  [(Integer,Char,Integer)] -> [(Integer,Char,Integer)]

checkTargetState state [] = []
checkTargetState state rest@(x:xs) = if (state == (getCurrState x))
  then x:checkTargetState state xs
  else checkTargetState state xs

checkAcceptStates :: Integer -> [Integer] -> Bool
checkAcceptStates x y = elem x y

--return true the char is equal to the
checkVal :: Char -> [(Integer,Char,Integer)] -> Bool
checkVal a [] = False
checkVal a (x:xs) = if (a == (getVal x))
  then True
  else checkVal a xs

--returns list of all triples with the same char
getTar :: Char -> [(Integer,Char,Integer)] -> [(Integer,Char,Integer)]
getTar a [] = []
getTar a (x:xs) = if (a == (getVal x))
  then x : getTar a xs
  else getTar a xs


accept :: [(Integer, Char, Integer)] -> [Integer] -> [Char] -> Bool
accept a b c = helper a b c 1

--halper function that takes in the accept function and a starting value
--to find the start state and iterate through the input alphabet
helper :: [(Integer, Char, Integer)] -> [Integer] -> [Char] -> Integer -> Bool
helper machine@(z:zs) acceptStates@(y:ys) [] a =
  checkAcceptStates a acceptStates
helper machine@(z:zs) acceptStates@(y:ys)(x:xs) n = if b
    then helper machine acceptStates xs a
    else False
  where
    b = if (getTar x (checkTargetState n machine)) == []
    then False
    else x == getVal (head (getTar x (checkTargetState n machine)))
    a = getTargetState (head (getTar x (checkTargetState n machine)))
