# The Advanced Approach

What I mean by "Advanced" is that it is no longer the basic FizzBuzz that I implemented, now you can basically add any rule you want.

I made some architectural choices :
- Multiple classes : This helps respecting the single responsibility principle
- Encapsulation : This time only `generate()` is available outside the `FizzBuzzGenerator` but the `rules` property is public, this could be private but I needed it for some tests, this could be improved.
- `FizzBuzzRule` is `Equatable`, it is convenient for testing, but not mandatory, this could avoid having multiple rules with the same `replacement` string for example. I arbritarily chose to add a UUID for that purpose.

## What I learnt

As Phil Karlton allegedly said

> There are only two hard things in Computer Science: cache invalidation and naming things

and that is true. I had a hard time finding meaningful names for the `FizzBuzzRule` properties and I am not quite satisfied but I had to settle with something eventually ...

## Steps


1 . Create every components

This might not be very TDDish but I first created the different components : `FizzBuzzGenerator` and `FizzBuzzRule` though they were empty.


2. Generator is initialized with the given rules

I check that when I init the generator with a set of rules they are stored inside the generator class. This is why the property `rules` is public instead of being private which would make more sense.


3. Generate FizzBuzz sequence without any rule

I check that when no rules are passed the sequence is returned without any transformation

```
FizzBuzzGenerator(rules: []).generate(upTo: 5)
```
returns
```
["1", "2", "3", "4", "5"]
```


4. Add a rule

I add the `Fizz rule` that is to say `replace multiples of '3' with 'Fizz'`

Firstly the rule is created like this :
```
FizzBuzzRule(replacement: "Fizz", isEligible: { $0 % 3 == 0 })
```

Applied to the generate the call to `generate(upTo: 5)` should return :
```
["1", "2", "Fizz", "4", "5"]
```

5. Add several rules that apply to the same number

The last step is to check the correct implementation of when multiple rules apply to a same number, for example `15` in the regular FizzBuzz game.

If I add the rule for `Buzz` to the previous one :
```
FizzBuzzRule(replacement: "Buzz", isEligible: { $0 % 5 == 0 })
```

The call to `generate(upTo: 15)` should return :
```
["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz"]
```
