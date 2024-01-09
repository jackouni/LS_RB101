# 1. 
**What would you expect the code below to print out?:**

  ```ruby
  numbers = [1, 2, 2, 3]
  numbers.uniq # => [1,3]

  puts numbers # => 1 2 2 3
  ```

  the code will output 1 2 2 3 in sequence

# 2. 
**Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:**

  1. what is != and where should you use it?

    A => `!=` is the 'not equal to' comparison operator. It compares two operands and checks for inequality. 
    If the two operands are not equal to eachother in value, `true` is returedn, else `false` is returned.
    If you wanted to check to see if a variable has reached a certain object in a loop, you might do something
    like this:
      ```
      a = 1
      while a != 10 do
        a += 1
        puts a
      end 
      ```

  2. put ! before something, like !user_name

    A => `!` is the 'not' operator. It negates the truthy/falsy value of an expression. 
    Everything other than `nil` and `false` are considered truthy, so in this example 
    user_name has to be either `false` or `nil` to be considered 'falsy'
    so it will return `true` because the `!` negates `true` to `false`,
    otherwise it will return `false`.

  3. put ! after something, like words.uniq!
    
    A => Generally a `!` appended to the end of a method name means the method will mutate
    the caller object. Whereas, without the `!` the method will just return a modified copy 
    of the caller object.

    In this case:
      ```ruby
      words = ['hi', 'you', 'to', 'hi', 'you']

      words.uniq  # => ['hi', 'you', 'to']
      p words     # => ['hi', 'you', 'to', 'hi', 'you']

      words.uniq! # => ['hi', 'you', 'to']
      p words     # => ['hi', 'you', 'to']
      ```

  4. put ? before something
      
    A => This will most likely give you an error. I don't think you can do this.

  5. put ? after something

      A =>  `?` appended to a method name generally means that the method will return a boolean.

  6. put !! before something, like !!user_name
      
      A => This is double negation. This means you're saying "not not". This is a common way to
      convert a value to its boolean truthy/falsy value.

      Example: `!!true` will evaluate to `true`

# 3.

