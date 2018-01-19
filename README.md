# Description

We have built a very successful Scrobly game, which up until recently is only available in Canada. We have recently won a contract to distribute in Mexico, which means our English centric scoring system will not work in the new market. 

Currently we use the scorer in the game this way:

    Scoring.new.score_letter('C') # returns 3

This behavior should not change. However the engineers developing the TileService have communicated they intend to use the `Scoring` in the following way for the Mexico version:

    language = :spanish
    Scoring.new(language).score_letter('C') # returns 2

# Scoring "Business Logic"

## Canada

English-language sets sold within Canada use:

    1 point: E, A, I, O, N, R, T, L, S, U
    2 points: D, G
    3 points: B, C, M, P
    4 points: F, H, V, W, Y
    5 points: K
    8 points: J, X
    10 points: Q, Z

## Mexico

Spanish-language sets sold within Mexico (known as Scrobly – Edición en Español) will use:

    1 point: A, E, O, S, I, U, N, L, R, T
    2 points: C, D, G
    3 points: B, M, P
    4 points: F, H, V, Y
    6 points: J
    8 points: K, LL, Ñ, Q, RR, W, X
    10 points: Z

## United States

We're not allowed to sell there because of something called "Scrabble."

# What We're Testing For

- You do not have to finish the code or reach a perfect solution.
- You should be able to explain the choices you have made.
- You should be able to demonstrate that you can:
    - read a method in Ruby
    - express business logic into new code
    - alter the behavior of existing code
- You may (for added bonus):
    - take advantage of refactoring opportunities
    - write new tests
    - make performance improvements

# References:

https://en.wikipedia.org/wiki/Scrabble_letter_distributions#Spanish
