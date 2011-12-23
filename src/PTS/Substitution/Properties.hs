{-# LANGUAGE ScopedTypeVariables #-}
module PTS.Substitution.Properties where

import Data.Set

import Test.Framework.Providers.QuickCheck2 (testProperty)
import Test.QuickCheck hiding ((.&.))

import PTS.AST
import PTS.AST.Arbitrary
import PTS.Pretty
import PTS.Substitution

substAvoidsCapture = testProperty "substitution avoids capture" $
  \t x t' ->
  x `member` freevars t ==>
  delete x (freevars t) `union` freevars t' == freevars (subst t x t')