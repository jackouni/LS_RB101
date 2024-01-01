# **Precedence**

"_operator precedence_"

These are a set of rules for Ruby to follow when evaluating an expression.
Which parts of this expression do I evaluate first?
It's the _precedence of operators in expressions in Ruby_

#### 2 Main Terms to sort out:

1. **Operators**

> _Are symbols that tell Ruby to perform a specific set of operations on a/some value(s)._

_Example:_

```ruby
a + b

# The `+` in this expression is the operator

```

2. **Operand**

> _Is an evaluated expression. This essentially just means a "value"._

_Example:_

```ruby
a + b

# Where `a` and `b` in this expression are the operands

```

<hr>

## Types of Operators:

1. ### Unary
   > Is an operator that needs 1 operand to perform an operation/action.

_Example:_

```ruby
!true

# Where `!` in the above expression is the unary operator

```

In the example above you can see that the `!` operator only needs 1 value, it's job is to negate the value of whatever proceeds it. It doens't act on multiple values, it acts on a single evaluated expression.

2. ### Binary
   > Is an operator that needs 2 operands to perform an operation/action.

_Example:_

```ruby
10 * 11

# Where `*` in the above expression is the binary operator

10 > 11

# Where `>` in the above expression is the binary operator

x = 180

# Where `=` in the above expression is the binary operator

"HEY YOU!" + (!true).to_s

# Where `+` in the above expression is the binary operator

```

In the example above you can see that the binary operators need 2 operands to perform an operation.
If you only have a value on 1 side of the operator, it will not be able to perform an operation. It needs 2 evaluated expressions.

Binary operators are the most common operators and are the ones you'll encountered in most cases.

3. ### Ternary
   > Is an operator that needs 3 operands to perform an operation/action.

_Example:_

```ruby
10 > 9 ? true : false

# Where `?` and `:` in the above expression is the ternary operator

# `10 > 9` and `true` and `false` are the operands here


```

In the example above you can see that the ternary operator needs 3 operands to perform an operation.
In the example above the first expression is evaluated and if the expression evaluates to true it returns the first value otherwise it returns the value after the colon.

<hr>

### Using `tap`

The `tap` method is a good way to go about debugging and to access objects in an expression to understand them.

`tap` takes a block and the block variable passed represents the calling object itself. Inside this block we can manuipulate or do things with the object if we want to.

`tap` always returns the object itself though, regardless of what happens within the block.

_Simple example:_

```ruby
# `tap` with an empty block:

array  = [1,2,3]

p array.tap { } # => [1,2,3]

```

_`tap` actually doing stuff:_

```ruby
array.tap do |x|
  x.each { |item| puts item}
end

# => 1
# => 2
# => 3

```

<hr>

### Use Parentheses!

Parentheses are a way to make sure things are predicatable.

We can add bracket around our expressions. That way the expressions contained in the brackets get highest priority and we can be more certain about the precedence of things in more complex expressions.

Sure, you could predict the precedence of all these operators, but it doesn't necessarily make your code more readable nor does it make it easier for others to edit and review if they don't understand or have precedence memorized.

Use parentheses!!

<hr>

### A List of Operator Precedence from Highest to Lowest:

```
!, ~, unary +

**

unary -

*, /, %

+, -

<<, >>

&

|, ^

>, >=, <, <=
_
<=>, ==, ===, !=, =~, !~

&&

||

.., ...

?, :

modifier-rescue

=, +=, -=, etc.

defined?

not

or, and

modifier-if, modifier-unless, modifier-while, modifier-until

{ } blocks
```
