# `OXOXOXOX` --- Ultimate Tic Tac Toe --- `XOXOXOXO`

This is a tic tac toe game that showcases proper object oriented programming and good coding practices.

## Gameplay
Rules are pretty straightforward:
- There are two human players, `p1` and `p2` for this example.
- Players can select their own names and symbols.
  - Say `p1` selects the name **"chris"** and **"&"**, and `p2` selects **"Stockfish"** and **"@"**
- Turn order will be randomly decided.
  - Say `p2: Stockfish` goes first, then they get to place their `@` anywhere on the 3x3 board.
  - `p1: chris` then goes next and places `&` anywhere that is not yet occupied.
  - To no one's surprise, this turn order continues.

- Players input two numbers separated by a space indicating which spot on the grid their next piece will occupy, and press the `Enter` key to make their move.
  - For example: `p2: Stockfish` > 2 2 indicates that `p2` will place an `@` at the centre of the 3x3 board where (1,1) is the top lefthand corner and (3,3) is the bottom righthand corner. 
- Players cannot place pieces on occupied spaces.

### The Twist:
- Players will **lose** the piece they placed first on the board such that there are only a **maximum of 4** pieces to a player on the board at any time.
- The game doesn't end until someone wins, **no draws**.