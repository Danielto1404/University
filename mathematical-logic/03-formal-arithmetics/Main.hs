{-# OPTIONS_GHC -O2 -optc-O2 #-}
{-# OPTIONS_GHC -fwarn-incomplete-patterns #-}


module Main where

import Parsing.ProofParser (getProvable, parseList)
import Logic.ProofExpression
import Logic.ProofAnnotator (annotate)

main :: IO ()
main = do
    contents                        <- getContents

    let (provableLine : proofLines) = lines contents
    let provable                    = getProvable provableLine
    let initialEvidence             = parseList $ proofLines
    let proofLines                  = annotate initialEvidence

    putStrLn ("|-" ++ (show provable))
    putStrLn $ getDescribingProof proofLines initialEvidence
    if (last initialEvidence /= provable) then
         case last proofLines of
            (NotFree _ _)  -> return ()
            (OccursFree _) -> return ()
            NotProved      -> return ()
            _              -> putStrLn "The proof proves different expression."
    else return ()

