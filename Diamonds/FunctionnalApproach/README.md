# The Functionnal Approach

Contrary to the naive approach, I splitted the main function into several parts. I still did TDD with recycling though. Functionnal programming is hard, especially with a language that was not designed for it at first. And yet it was very fun coming up with ideas that could achieve the diamond in a functionnal way.

If you look at the source you will see in the main function `printDiamond` I used several variables, I had to because the compiler was not keeping up with how much calculation there was if every statement was chained but the function behaves as if.

I chose to create some functions for clarity, it is still without side-effect so no cheating here. It is one thing that I learned with this approach, FP can be messy really fast. Splitting into functions and immutable variables is a good way of preventing it.

# Steps

### If you do not want to dive into the code or if you have no knowledge of Swift here are the steps I took with this approach

###### All the examples provided are given for the letter 'C'



1. Create the sequence

I create a sequence of letters from 'A' to the passed letter by using their unicode value to create them then convert them back to `String`

```
["A", "B", "C"]
```



2. Create a row

For each letter, I create a `String` composed of the letter, the right amount of space, the letter again and then a separator (here I used a simple comma). The amount of space is given by the index of the row via a bit of math.

```
["AA,", "B B,", "C   C,"]
```



3. Format rows

I merge the sequence into a single `String` to get rid of the first character 'A' and then create a new sequence by splitting the `String` based on the previous separator.

```
["A", "B B", "C   C"]
```



4. Add leading spaces

The amount of leading spaces for each row is inversely proportionnal to its index. To make it directly propertionnal I reverse the sequence, add the leading spaces and then revert it back to its original state 

```
["  A", " B B", "C   C"]
```



5. Wrap it in an array

I take the previous sequence and I wrap it inside an array. It is mandatory for the next step

```
[["  A", " B B", "C   C"]]
```



6. Assemble the diamond

Now is the easy part, from the englobing array, I take every sub sequences, though there is only one (let's call it B), merge the original B and the reversed-without-it-last-element B, flatten it, and then join it with a carriage return.

```
  A
 B B
C   C
 B B
  A
```

## Lessons I learnt

You have trouble understanding the different steps ? It is either because my English is not up to the task or because functionnal programming is hard to explain/understand

I had to find tricks to achieve my goal (the use of a separator in Step 2, or wrapping the sequence in an array in Step 5) I could avoid in the [Naive approach](https://github.com/Naxyoh/Kata/tree/master/Diamonds/NaiveApproach.playground) but as I said earlier, FP messed with my head but I am glad it did.
