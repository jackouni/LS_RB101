<h1 style="text-align: center;"><ins>Variable Scope</ins></h1>

<blockquote style="text-align: center;">A _variable scope_ is used to describe where in a program a variable can and can't be accessed from.</blockquote>

> _"Local Scope"_ as defined as:
> A block of code contained between either `{ }` (curly braces) or `do ... end`.

<hr>

## Basic Scope Rules :

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

<hr>

## Nested Scopes

Scopes can be nested within each other. So you can nest a local scope within another local scope.

Here's the thing - Scopes can access variables defined outside of their scope in the outer scope, but can't refer to the inner scopes of other scopes. 

Each new local scope lives in its own world where it can view other variables from outside of it's scope but it doesn't let anyone from the outside see into their own.

_Example from Launch School:_
```ruby
a = 1           # first level variable

loop do         # second level
  b = 2

  loop do       # third level
    c = 3
    puts a      # => 1
    puts b      # => 2
    puts c      # => 3
    break
  end

  puts a        # => 1
  puts b        # => 2
  puts c        # => NameError
  break
end

puts a          # => 1
puts b          # => NameError
puts c          # => NameError
```

<hr>

## Variable Shadowing

> When a parameter to a block has the same name as an outer scoped variable.

_**In the case of Blocks**_:

The block variable will represent whatever that block is suppose to represent in the calling method and object. When we variable shadow we prevent ourselves from modifying or accessing the outer scoped variable because Ruby assumes the same-named variable represents the block variable.

_To make this more clear:_

```ruby
movie = "Dumb and Dumber"
movies = ["Shrek", "Shrek 2", "Shrek 3"]

movies.each do |movie|
  puts movie
end

# Output=> "Shrek", "Shrek 2", "Shrek 3"

```
As you can see above, despite the outer scoped variable being named `movie` and the block variable also being named `movie`, within the block scope, the names of the items within the `movies` array were printed to the terminal.

The `movie` variable within the context of the block scope represents each item of the `movies` array.

The `movie` block variable is _'shadowing'_ the outer scoped `movie` variable.

This also means we cannot reassign the value of an outer variable we're shadowing:
```ruby
x = 100

1.times do |x|
  x = 20
end

puts x
# Outputs=> '100'

```
The `x` variable defined in the above example exists within that block scope and techincally is being intialized.

#### _In the case of Method Definitions..._

You don't have variable shadowing. This is because method definitions don't have access to variables in the outer scope.

_Example:_
```ruby
thing = "hey!"

def print_thing(thing)
  puts thing
  thing = 10
end 

print_thing("howdy!") #=> howdy
puts thing #=> hey
```
As you can see in the above example, despite there being a reassignment, `thing = 10`, the outer scoped `thing` variable is not altered. This is because method definitions cannot "see" the scope outside of their deifnition.

The above looks like variable shadowing because of the parameter name being same-named as `thing`. But here's a test to show how the variable scoping works in a method definition:
```ruby
thing = "hey!"

def print_thing(foo)
  puts thing
  thing = 10
end 

print_thing("howdy!") #An Error is outputted: "undefined local variable or method `thing' ..."
puts thing # And this line never runs because execution stopped on the last line due to the error
```
This leads us to .....

<hr>

## Rules to Method Scoping:

1. #### Methods can't access variables from an outer scope
  As seen in the last section in the last example, we can see that methods can't access variables from the outer scope.

  ```ruby
  word = "bird"

  def my_method
    puts word
  end 
  
  my_method() # => NameError: undefined local variable or method `word' ... 

  ```
2. #### Methods can access objects passed to it
  Methods can access varaibles/objects passed to them as arguments though.

  ```ruby
  word = "bird"

  def my_method(a)
    puts a
  end

  my_method(word) # => bird

  ```
3. #### Method name == Variable name
  If a method shares the exact same name as a variable's name, what happens when we call that name in our program? 

  What will Ruby do? How will it evaluate this?

  ```ruby
  hello = "HELLO WORLD!"

  def hello
    "HEYO EARTH"
  end

  puts hello # => HELLO WORLD!

  ```
  As you can see, Ruby will output the value of the `hello` variable.

  This is becasue Ruby first searches for a variable with the same name and if it can't find a variable that matches that name then it searches for a method with the same name.

  To avoid confusion we could add parentheses to the `hello` to tell Ruby that we're wanting to invoke the `hello` method.

  ```ruby
  hello = "HELLO WORLD!"

  def hello
    "HEYO EARTH!"
  end

  puts hello() # => HEYO EARTH!

  ```

4. #### Blocks in Methods

  The same block scoping rules apply to blocks that are defined in method definitions.

  _Here's an example from Launch School:_

  ```ruby
  def some_method
    a = 1
    5.times do
      puts a
      b = 2
    end

    puts a
    puts b
  end

  some_method # => NameError: undefined local variable or method `b' for main:Object
  ```
<hr>

## Constants

Constants in Ruby have different scoping rules when compared to local variables.

**Differences with Constants and Scoping:**
- Constants _**CAN**_ be accessed from within Method definitions
  ```ruby
  USER = "Jack"

  def print_user
    puts "Welcome #{USER}"
  end

  print_user() #=> Welcome Jack
  # Unlike local variables, this works ^^^

  ```
- Constants intialized within blocks can also be accessed from the outer scope.
  ```ruby
  1.times do 
    CITY = "TORONTO"
  end

  puts CITY #=> TORONTO

  ```
- Blocks are said to have _"lexical scope"_. This will be covered in later lessons.

<hr>

This is everything from that assignment. Next assignment covers even more about variable scoping.