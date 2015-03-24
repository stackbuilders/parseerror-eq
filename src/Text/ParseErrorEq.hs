{-# OPTIONS_GHC -fno-warn-orphans #-}

{-|
Module      : Text.ParseErrorEq
Description : Adds an Eq instance for Parsec's ParseError type if needed
Copyright   : (c) Stack Builders Inc., 2015
                  Someone Else, 2014
License     : GPL-3
Maintainer  : justin@stackbuilders.com
Stability   : experimental
Portability : POSIX

This module adds an Eq instance for Parsec's ParseError type if it's
needed. Import by using (since this module only provides instances):

> import Text.ParseErrorEq ()

For reference, Parsec 3.1.9 adds the Eq instance, in the commit here:

https://github.com/aslatter/parsec/commit/3fb40aaa683fd90f3f0dd9f3c32c6ba707fb24b1
-}
module Text.ParseErrorEq where

#if MIN_VERSION_parsec(3,1,9)

-- ParseError Eq instance already defined in Parsec, not necessary to add.

#else

import Text.Parsec.Error (ParseError)
import Text.ParserCombinators.Parsec.Error
  (errorPos, errorMessages, messageString)

--| This implementation of Eq for ParseError is the same as the one
--  added in Parsec in the above commit.
instance Eq ParseError where
  l == r
       = errorPos l == errorPos r && messageStrs l == messageStrs r
    where messageStrs = map messageString . errorMessages

#endif
