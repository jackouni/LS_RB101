<h1 style="text-align: center;"><ins>Variable Scope</ins></h1>

<div style="display: flex ; justify-items: center ;"><blockquote>A _variable scope_ is used to describe where in a program a variable can and can't be accessed from.</blockquote></div>

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



