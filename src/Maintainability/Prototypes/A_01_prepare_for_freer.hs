{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}

module Maintainability.Prototypes.A_01_prepare_for_freer
  ( main
  ) where

import Prelude hiding (putStrLn, readFile)

import qualified Data.Text as T
import qualified Data.Text.IO as T
import qualified Data.Time.Clock as C
import qualified System.Environment as IO

import Control.Monad.Freer (Eff, LastMember, Member, Members, interpretM, runM, send)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Control.Natural (type (~>))
import Data.Function ((&))
import Data.Semigroup ((<>))
import Data.Text (Text, pack, unpack)
import Data.Text.IO (putStrLn, readFile)
import Data.Time.Clock (UTCTime, diffUTCTime, getCurrentTime)
import System.Environment (getArgs)

main :: IO ()
main = runM $ mainLogic

mainLogic :: (MonadIO m, LastMember m r, Members '[] r) => Eff r ()
mainLogic = do
  startTime <- liftIO getCurrentTime
  [fileName] <- liftIO getArgs
  target <- liftIO $ readFile fileName
  liftIO $ putStrLn $ "Hello, " <> target <> "!"
  endTime <- liftIO getCurrentTime
  let duration = endTime `diffUTCTime` startTime
      durationMicroseconds = round $ duration * 1000 * 1000 :: Integer
  liftIO $ putStrLn $ pack $ show durationMicroseconds <> " microseconds"

{-
stack runhaskell src/Maintainability/Prototypes/A_01_prepare_for_freer.hs hello-target.txt
-}
