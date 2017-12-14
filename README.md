# Haskell Fundamentals
Learning project for haskell

## How this project was created
- brew install haskell-stack
- stack new haskell-fundamentals
- cd haskell-fundamentals
- stack test
- git init
- git add --all
- git commit -m "Created haskell-fundamentals project"
- git remote add origin git@gitlab.cj.com:sshubin/haskell-fundamentals.git
- git push -u origin master

## How to launch a particualr entry point from the command line
- choose in entry point to run, for example
    - src/HelloAlice.hs
- run it as a script, like so
    - stack runhaskell src/HelloAlice.hs

## How to set up test monitoring
stack test --file-watch