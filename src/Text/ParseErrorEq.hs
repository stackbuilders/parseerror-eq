{-# OPTIONS_GHC -fno-warn-orphans #-}

module Text.ParseErrorEq where

#if MIN_VERSION_parsec(3,1,9)

{-|
Parsec's ParseError already contains an Eq definition in this version,
so there is no need to add it.  The Eq instance was added to Parsec in
version 3.1.9, in this commit:

https://github.com/aslatter/parsec/commit/3fb40aaa683fd90f3f0dd9f3c32c6ba707fb24b1
-}

#else

import Text.Parsec.Error (ParseError)
import Text.ParserCombinators.Parsec.Error
  (errorPos, errorMessages, messageString)

-- This implementation of Eq for ParseError is the same as the one
-- added in Parsec in the above commit.
instance Eq ParseError where
  l == r
       = errorPos l == errorPos r && messageStrs l == messageStrs r
    where messageStrs = map messageString . errorMessages

#endif
