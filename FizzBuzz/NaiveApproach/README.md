# Basic Approach

This kata is perfect of discovering the TDD approach. I chose to create a class responsible of all the FizzBuzz logic  `FizzBuzzGenerator`, it is not mandatory for a playground but in a real project you should definitively do it.

In this class there are two methods:

- `transform(number:)` responsible for transforming a single number in its equivalent in FizzBuzz
- `generate(upTo:)` responsible for generating the whole FizzBuzz sequence

I separated the logic into two different methods because it was easier to test this way. One downside is that depending on how you use the class it might be useful to put `transform(number:)` as private but then all the tests for this method would have to migrated towards the `generate(upTo:)` one.

## What I learnt

This was my first time doing TDD on my own, sticking to the red-green-refactor can be difficult as I wrote some code ahead of tests sometimes. 

Using a playground however was a really good idea, had I used a plain Xcode project it would have taken me a lot more time just to launch my tests as Xcode would have to compile every time.

## Steps

#### If you do not want to dive into the code or if you have no knowledge of Swift here are the steps I took with this approach

Each step is linked to a unit you can find in the playground.


1. Do not transform non-eligible number

All numbers which are not eligible to the FizzBuzz rules (`3` or `5`) should not be transformed by `transform(number:)`

##### Example
```
transform(2)
```
should return
```
2
```


2. Transform multiples of `3` into `Fizz`

When multiple of `3` is passed, `transform(number:)` should return `Fizz`

##### Example
```
transform(6)
```
should return
```
Fizz
```


3. Transform multiples of `5` into `Buzz`

When multiple of `5` is passed, `transform(number:)` should return `Buzz`

##### Example
```
transform(10)
```
should return
```
Buzz
```

4. Transform multiples of `3` and `5` into `FizzBuzz`

When multiple of `3` and `5` is passed, `transform(number:)` should return `FizzBuzz`

##### Example
```
transform(15)
```
should return
```
FizzBuzz
```


5. Apply `transform(number:)` to a sequence

Generate a sequence from `1` to the value passed to `generate(upTo:)` where each value is processed by `transform(number:)`

##### Example
```
generate(upTo: 15)
```
should return
```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
```
