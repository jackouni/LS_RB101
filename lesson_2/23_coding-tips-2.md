# Coding Tips 2

## 1. Using New Lines
  Using line spaces in your code can help segregate different parts of your code to make it more readable.

  Much like how writers have paragraphs to separate ideas, programmers should use new lines to separate different parts of their code.

  This makes code a lot more readable, easy on the eyes and allows us to mentally and visually lump sections together. Overall, this makes for a smoother experience in maintaining and reading code.

  _Example of bad spacing:_
  ```ruby
  name = ''
  puts "Enter name:"
  loop do
    name = gets.chomp
    break if valid_name?(name)
    puts "Please enter valid name!"
  end
  puts "Welcome #{name}!"
  ```
    _Example of better spacing:_
  ```ruby
  name = ''

  puts "Enter name:"
  loop do
    name = gets.chomp
    break if valid_name?(name)
    puts "Please enter valid name!"
  end

  puts "Welcome #{name}!"
  ```
  > This is a lot easier to read. As you can see we've visually split up our code into 3 parts:
  > 1. Initialize `name`; 2. user input; 3. Display welcome message;
  <br>

## 2. Side Effects, Side Effects, Side Effects
  Again, as covered in the last "coding tips" assignment, it's important to be aware of what a method is giving you. 
  
  Generally, you want a method to either give you a meaningful return value or give you a side effect, but **NOT** both. 
  
  (Technically a value is always going to be returned, but the intention and meaning behind that return value is what we're getting at when we say "_meaningful return_")

  By picking one or the other you make your code more straight forward and always keep things simple. A method does one things, not multiple things.

  And being aware of what a method is giving you is also just important when reading documentation or other people's methods. 

  **Ask:** _"What does this method give me? Is it a meaningful value or a side effect?"_

  _Example with side effect methods:_
  ```ruby
  # Side Effect: Changing the terminal display
  def product(x, y)
    puts (x * y)
  end 

  # Side Effect: Mutating the passed `word` variable.
  def append_string(word, word2)
    word >> word2
  end
  ```
  > As you can see both produce a side effect.
  > _AKA_ A change in our code that is outside of the method's scope. This can be anything from a change in our terminal display to a passed variable being mutated.

  _Example with meaningful `return` methods:_
  ```ruby
  # Side Effect: None. The product of the 2 arguments is returned.
  def product(x, y)
    x * y
  end 

  # Side Effect: None. The 2 arguments concated together is returned
  def append_string(word, word2)
    word + word2
  end
  ```
  <br>

## 3. Name Methods Appropriately
  This one feels like common sense, but is super important. 
  
  This is especially true if you're dealing with a big codebase. 

  A good sign that your methods aren't named properly is if you find yourself having to go back to the method definition and trying to figure out it's implementation.

  If you want to remember what methods do, then giving them an appropriate name is important.

  If a method prints something to the terminal consider starting your method names off with:
    - `print_`
    - `display_`
    - `output_`
    - `puts_`
  These are keywords you can use to make it really clear that you're printing something.

  Don't use `return` or `returns` in your method names. A `return` is just implied if there's no other words prefacing the method name like `get_`, `set_`, `print_`, `update_`, etc etc.

  > _"If you can treat a method as a "black box", then it's a well designed method."_
    > ~ _Launch School_
  
  If you're mutating something, it's convention to name it with `!` appended to the end of the name. Words like `update_` can also be prepended to a method's name to indicate that we are producing a side effect.

## 4. Don't Mutate the Caller During Iteration

  Don't mutate the caller object of an iterative method.

  In other words, don't make mutations to the object calling the iterative method itself. Otherwise you'll be making changes during the iterative operation and may get unexpected behaviours.

  You can mutate the individual items of the caller/collection, but **DON'T** mutate the caller.

  ```ruby
  a = ['a','b','c','d','e']

  a.each { |letter| letter.upcase! }

  p a # ['A','B','C','D','E']
  ```
  > This is acceptable. We're mutating the individual items of the array, `a`, represented as `letter` in the `.each` code block.
  <br>

  ```ruby
  a = ['a','b','c','d','e']

  a.each { |letter| a.delete(letter) }

  p a # ['b', 'd']
  ```
  > This is not acceptable. As you can see we're accessing the `a` variable directly during iteration through itself. This is what causes weird things to happen.
  <br>

## 4. Variable Shadowing
  Variable shadowing is when block variable's alias has the same name as a variable in the outer scope.
  What this will do within a block, is "block" you from accessing the outer variable scope. This is because Ruby is first interpretting the block variable instead of the outer variable.

  _Example:_
  ```ruby
  greeting = "Greeting => "

  ["Hi ", "Bonjour "].each do |greeting|
    puts greeting + greeting
  end 

  # => "Hi Hi"
  # => "Bonjour Bonjour" 
  ```
  > In the example above, `greeting` as initialized in the outer scope is not being accessed within the block. This is because the block variable is also named `greeting` that's representing the item for each iteration in the caller object, shadowing the outer scope `greeting`.

    _This will work:_
  ```ruby
  greeting = "Greeting => "

  ["Hi ", "Bonjour "].each do |word|
    puts greeting + word
  end 

  # => "Greeting => Hi"
  # => "Greeting => Bonjour" 
  ```
  > By renaming the block variable we're now able to access the values we want to access. No variable shadowing here.
  <br>

## 5. No Assignments in Conditionals
  Straight forward - Don't use the assignment operator (`=`) in a conditional expression.

  This is confusing, and can beg the question: _"Did you mean `==` or `=`?"_

  Some Rubyist will use `=` in a conditional but it is generally not recommended. 

  And if you do decide to use `=` in a conditional, then wrap the expression in brackets to make it more obvious to future programmers and your future self that you understand what the expression is returning.
  <br>

## 6. Underscores For Unused Parameters
  If you have an unused parameter, it's convention to use `_` to represent it. 

  _Example:_
  ```ruby
  ['joe','beck','love'].each { |_| puts "There's a name here"}

  ```

  And of course you should use `_` to represent unused parameters in blocks that take 2 arguments as well.

  _Example:_
  ```ruby
  values = [12, 41, 19]
  values.each_with_index { |_, ind| puts "index #{ind}" }

  ```
  > This is a stupid example because in real life you'd probably just use the `#each_index` method, but this illustrates the point 😜

  <br>

## 7. Struggle Is Important - It's Learning

  Struggling through coding is normal. We can memorize all the rules, the correct way of doing things or best practices, but ultimately, the thing that really teaches these things is through making mistakes and struggling.

  It's okay to make mistakes and do things sub-optimally. It teaches you and gives you context for what not to do. 

  The rules and lessons taught in these assignments are meant to give you the "_why_" but for the more full context you need to experience what bad code and errors looks like. The struggle is the teacher.





