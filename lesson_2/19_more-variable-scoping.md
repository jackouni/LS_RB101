# <ins>More Variable Scoping</ins>

<hr>

## Terms & Vocab:
1. ### Method Definition:
> Is the section where you define what a method does and how it does it, in code. Techincally speaking, this the section is contained between `def` and `end` keywords, where you define your method's name, parameters it takes, and the code it will execute when called/invoked.

<br>

2. ### Method Invocation:
> Simply put, it's when a method is called on within your program. When a method is invoked it will execute the code defined within its definition.

<br>

<hr>

## Ways to Invoke a Method:

1. ### Referencing the Method Name
  This is code that is invoked by simply calling the name of the method.
  _**Example :**_ 
  ```ruby
  my_method 
  # Invokes the method, 'my_method'`

  ```
  
  <br>

2. ### Bracket Invocation
  We can invoke a method by calling the method's name followed by brackets (this can be with or without arguments passed, depending on how the method is defined.)
  _**Example :**_ 
  ```ruby
  my_method() 
  # Invokes the method, 'my_method'

  ```

  <br>

3. ### Block Invocation
Blocks are a way to invoke methods. In fact, you can invoke any method with a block, whether the code within the block executes or not is entirely based on method's definition. Even if a method doesn't take a block and won't execute a block passed to it, it will still be invoked with a block.
_**Example :**_ 
```ruby
def say_hello
  puts "HELLO"
end

say_hello { } 
# Invokes the method, 'say_hello'
#=> HELLO

```
_**Or this :**_
```ruby
def say_hello
  puts "HELLO"
end

say_hello do 
  puts "GOODBYE"
end 
# Invokes the method, 'say_hello'
#=> HELLO

```
> As you can see, in the last example, the `puts "GOODBYE"` within the `do ... end` block does not execute due to the details of the method's definition - it doesn't take a block. The specifics on how this works will supposedly be covered in later lessons.

_**If we use the `yeild` keyword though...**_
```ruby
def say_hello
  yield
  puts "HELLO"
end

word = "GOODBYE"

say_hello do 
  puts word
end 
#=> GOODBYE 
#=> HELLO

```
> `yield` tells Ruby that we want to execute a block at a certain point in our method's execution. As you can see, because blocks have access to the outer scope, we are able to access the `word` variable. The specifics on how this works and its nuances will be covered later.

<br>

<hr>

4. ## More on Block Invocation...

- ### Methods can use the return values of blocks
  Consider the `Array#map` method:
  ```ruby
  a = 'hey'
  [1,2,3].map { |num| a } #=> ["hey", "hey", "hey"]

  ```
  > The `Array#map` method is using the returned value from the block to return a new array. In this case, the blcok is returning the value of `a` for each iteration of `num` in the calling object, `[1, 2, 3]`.

<br>

<hr>

<br>

#### Put beautifully by Launch School:

> _"-we can think of method definition as setting a certain scope for any local variables in terms of the parameters that the method definition has, what it does with those parameters, and also how it interacts (if at all) with a block. We can then think of method invocation as using the scope set by the method definition. If the method is defined to use a block, then the scope of the block can provide additional flexibility in terms of how the method invocation interacts with its surroundings."_

<br>

##### **In other words...**
Method definitions define what local variables a method could have access to in the outer scope, what it can do with those local variables and if it can use a block for extra context. 
<br>
Method invocation can be thought of as telling the method what to do within the scope it has defined. 
<br>
If a method is defined to take a block, then a block can give our method more flexibility in terms of using locally/outer scoped variables.