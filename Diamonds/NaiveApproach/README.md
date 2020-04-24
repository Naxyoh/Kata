# The Naive Approach

The approach I took was TDD but recycling the same test instead of writing a bunch of tests, that is because each time I would modify the system under test (which is a single function here) to pass a new test, it would break the tests that were passing before.

# Steps

### If you do not want to dive into the code or if you have no knowledge of Swift here are the steps I took with this approach

All the examples will be about printing a diamond for 'C'

1. Printing

Only print the passed letter in the console
```
C
```

2. Create the sequence

Print letters in order from 'A' to the passed letter
```
ABC
```

3. Repeat the sequence

Repeat all letters twice except for the 'A'
```
ABBCC
```

4. Add carriage return

Add a carriage return between each different letters
```
A
BB
CC
```

5. Add leading spaces

Add the right number of spaces before the first letter of each row
```
  A
 BB
CC
```

6. Add spaces  between letters

Add the right number of spaces between the letters of each row
```
  A
 B B
C   C
```


7. Create diamond

Copy the "pyramid", remove last row, invert it and add it to the former pyramid
```
  A
 B B
C   C
 B B
  A
```  

And here it is !
