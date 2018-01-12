{-# LANGUAGE DeriveFunctor              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase                 #-}

module Terrafomo.Syntax.Variable
    ( Attribute (..)
    , Argument  (..)
    , Output    (..)
    ) where

import Data.Hashable (Hashable (hashWithSalt))

import Terrafomo.Syntax.Name (Key, Name)

-- | An attribute dependency of the form:
--
-- > instance = "${aws_instance.example.id}"
--
-- That is, attributes are 'computed' as outputs of a resource or data source
-- during a terraform run.
newtype Attribute a = Computed Name
    deriving (Show, Eq, Functor, Hashable)

-- | An argument is either a 'computed' attribute of another terraform resource
-- or data source, a Haskell value, or an absent value.
data Argument a
    = Compute !Key !(Attribute a)
    | Present !a
    | Absent
      deriving (Show, Eq, Functor)

instance Hashable a => Hashable (Argument a) where
    hashWithSalt s = \case
        Compute k a -> s `hashWithSalt` (0 :: Int) `hashWithSalt` a
        Present   x -> s `hashWithSalt` (1 :: Int) `hashWithSalt` x
        Absent      -> s `hashWithSalt` (2 :: Int)

-- | An explicitly declared output variable of the form:
--
-- > output "ip" {
-- >   value = "${aws_eip.ip.public_ip}"
-- > }
data Output a = Output !Name !a