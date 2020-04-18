# The Functionnal Approach

Contrary to the naive approach, I splitted the main function into several parts. I still did TDD with recycling though. Functionnal programming is hard, especially with a language that was not designed for it at first. And yet it was very fun coming up with ideas that could achieve the diamond in a functionnal way.

If you look at the source you will see in the main function `printDiamond` I used several variables, I had to because the compiler was not keeping up with how much calculation there was if every statement was chained but the function behaves as if.

I chose to create some functions for clarity, it is still without side-effect so no cheating here. It is one thing that I learned with this approach, FP can be messy really fast. Splitting into functions and immutable variables is a good way of preventing it.
