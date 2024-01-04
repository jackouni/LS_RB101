# <ins>Variable Scope</ins>

  > A _variable scope_ is used to describe where in a program a variable can and can't be accessed from.

  ## Basic Scope Rules :
    > _"Local Scope"_ as defined as:
    > A block of code contained between either `{ }` (curly braces) or `do ... end`.

    - You can access variables intialized in the outer scope within a local scope.
  ```ruby
  points = 20

  loop do
    puts points
    break
  end 

  # Will output '20' to the terminal

  ```
    - You can re-assign the value of variables intialized in the outer scope within a local scope.
  ```ruby
  points = 20

  loop do
    points = 30
    break
  end 

  puts points
  # Will output '30' to the terminal

  ```
    - You cannot access variables intialized in the local scope from the outer scope.
  ```ruby
  loop do
    number = 30
    break
  end 

  puts number
  # Will output an error: NameError: undefined local variable or method `number'

  ```
    - You cannot re-assign the value of variables intialized in the local scope from the outer scope.
  ```ruby
  loop do
    number = 30
    break
  end 

  number = 40
  # Will output an error: NameError: undefined local variable or method `number'
  
  ```

