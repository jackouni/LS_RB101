# <ins>Pass by Reference 🆚 Pass by Value</ins>
> A widely debated topic amongst Rubyist. 
> Is Ruby _pass by reference_ or _pass by value_?
> A debate on what Ruby does under the hood when passing objects to methods.
> Are objects passed to methods _references_ to that object in memory, or are they _copies_ of that object?

### Defining Terms & Vocab:

- #### "_Values_"
> In context to this lesson, _values_ represent a copy of an object. The value of an object is a copy of the object.

<br>

- #### "_References_"
> In context to this lesson, _references_ represent a reference to a spot in memory where an object resides. It's not a copy of the object, it's a direct reference. 

<br>

<hr>

## Case for "Pass by Value"

Some Rubyist will argue that Ruby is a pass-by-value language.

Because when you pass an object to a method and try to reassign its value within the method definition, it doesn't actually change the value of that object in the outer scope.

<br>

_**Example :**_
```ruby
def change_object(obj)
  obj = 25
end 

obj = 100

puts obj #=> 100

change_object(obj) 

puts obj #=> 100

```
> In the above code snippet, you can see that even though we passed `obj` to the `change_object` method > and reassigned its value within `change_object`'s definition, when we reference  `obj` after invoking > `change_object` we still get the value of `100` for `obj`. 

<br>

This leads us to belive that we are passing _'values'_ (copies) of an object to a method and not actually changing the object that exists in the outer scope.

<br>

<hr>

## Case for "Pass by Reference"

But if Ruby was purely _"pass by value"_ then we shouldn't be able to mutate or modify variables passed to methods.

This is because the variables we pass would supposedly be copies of the original object.

Therefore, we wouldn't be modifying or mutating the original object, we'd be mutating/modifying the copy of the object.

<br>

_**So why does this work then?? :**_
```ruby
def change_object(obj)
  obj.upcase!
end

obj = "joe"
puts obj #=> joe

change_object(obj)
puts obj #=> JOE

# 🤯 ?!

```
> This would imply that Ruby is NOT "_pass by value_"., because we're able to directly "_reference_" the passed object and modify it. _This is not copy... right?_

<br>

Within the method operation we were unable to modify the passed variable with reassignment, but now we're able to modify the variable passed. What gives?

Not all actions or operations performed in a method definition will mutate the original object passed. 

With a slight change we can make sure there is no mutation of the original object passed and that there is no _"pass by reference-ish"_ behaviour:
```ruby
def change_object(obj)
  obj.upcase
end

obj = "joe"
puts obj #=> joe

change_object(obj)
puts obj #=> joe

```
> Looks like we're back at "_pass by value_" behaviour again...
> Why does Ruby do this and how does it do this?

<br>

<hr>

## What is Ruby Doing Here? What's the Verdict?
As we can see Ruby exhibits both _pass by reference_ and _pass by value_.

> _"Some people call this **'pass by value of the reference'** or **'call by sharing'**."_
  > _~ Launch School_

When an operation within a method definition mutates the caller object, the method is modifying the original object.

So, how can we tell when we're working with a method that references an object directly 🆚 one that uses a copy of the object?

**Answer:**
There are some things that indicate a method will mutate an object, these are defined with `!` appended to the end of the method name. 

> Methods like: `capitalize!`, `map!`, `downcase!`.

If a `!` is not present at the end of a method name, this does not guarentee that the method isn't destructive or that it won't mutate the caller object. The `!` is merely a naming convention, and does **NOT** give you any guarentees.

> `Array#<<` method is destructive and will mutate a caller object, but obviously does not contain a `!` in it.

<br>

#### Reassignment is Not Destructive

```ruby
def add_value(array, value)
  array = array + [value]
end 

nums = [20, 15, 10, 5]
add = 1

add_value(nums, add)
p nums #=> [20, 15, 10, 5]

```
Notice that reassignment is not a destructive operation. `nums` is not changed or mutated.
 
But with some slight changes we can make it destructive:
```ruby
def add_value(array, value)
  array = array << value
end 

nums = [20, 15, 10, 5]
add = 1

add_value(nums, add)
p nums #=> [20, 15, 10, 5, 1]

```

This tells us that `+` operation is returning a new value from the expression.

Whereas, `<<` is directly modifying a value in the expression.

<br>

<hr>

## Adding Onto This Lesson...

- ### Variables as Pointers
  > Reviewing the concept of variables as pointers.

  Variables should **NOT** be thought of as: _containers that house values._ <br />
  Variable **SHOULD** be thought of as: _pointers to places in memory that hold values._

  <br>

  Variables are simply pointers to places in memory. When we reference or call a variable we just being pointed towards a place in memory.

  <br>

  _Here's an example to illustrate:_
  ```ruby
  a = 50
  b = a
  a = 10

  puts a #=> 10
  puts b #=> 50
 
  ```
  > _As you can see..._
  > - `a` is originally pointing to a spot in memory with the value of `50`.
  > - `b` points to `a` and just follows `a` to where it was pointing. Meaning `b` is now pointing the spot in memory with the value of `50`.
  > - We reassign `a` to point to a spot in memory with a value of `10`. 
  > - When we `puts a` we're pointing to the new spot in memory with `10`.
  > - When we `puts b` we're pointing to the spot in memory with `50`.

<br>

- ### Mutable vs Immutable Objects

  After the last point, we understand that variables act as pointers to places in memory. 

  But what happens when we try to edit or mutate these objects/values in memory? 

  Fortunately, there's a method we can take advantage of that can tell us the 'key' or spot in memory that an object resides.

  That method is `object_id`.

  _Here's an example:_
  ```ruby
  a = "Hi"
  b = "Bye"

  puts a.object_id
  puts b.object_id

  ```
  > Running the above code, you should get 2 different "memory addresses" printed for `a` and `b`.
  > `a` and `b` take up two different spots in memory.

  _But, what if we modify these values??_
  ```ruby
  a = "Hi"
  b = "Bye"

  puts " 'a' before => #{a.object_id}"
  puts " 'b' before => #{b.object_id}"

  b = a

  puts " 'b' reassigned to 'a' => #{b.object_id}"

  a = "Hallo"

  puts " 'a' reassigned to \"Hallo\" => #{a.object_id}"
  puts " 'b' => #{b.object_id}"

  ```
  > After assigning `b` to `a` we can see that `b` is exhibiting the expected behaviour, it's following `a`'s pointer and pointing to the same spot in memory.
  > After reassigning `a` to a new value, the object ID of `a` is now changed.
  > The object ID of `b` is still the same as the original `a` though.

  _What if we reassign something to the same value?_
  ```ruby
  a = "LS"

  puts " 'a' object ID => #{a.object_id}"

  a = "LS"

  puts " 'a' object ID => #{a.object_id}

  ```
  > Strangely, even though we reassigned the value of `a` to be the exact same as it was originally, it still created a new place in memory for this reassignment.

  <br>

  ```ruby
  a = "LS"

  puts " 'a' object ID => #{a.object_id}"

  b = "LS"

  puts " 'b' object ID => #{b.object_id}

  ```
  >  We can see this in this example too. `=` creates a duplicate of the value `"LS"` in memory.

  <br>

  _So why doesn't this work then??_
  ```ruby
  a = 10

  puts " 'a' object ID => #{a.object_id}"

  a = 10

  puts " 'a' object ID => #{a.object_id}

  ```
  > Despite us reassigning the value of `a` using the `=` operator, the object ID is still the same. It did not create a new space in memory like in our previous examples.

  <br>

  Okay Jack, what is this spooky witch magic?

  <br>

  This is due to mutable 🆚 immutable objects.

  <br>

  #### Mutable:
  > Mutable objects are values that when created or reassigned will create new spots in memory. They don't come built into Ruby, your system decides as the program executes, where these newly made values are going to be placed in memory. This is the behaviour we've witnessed in our first exmaples.

  <br>

  #### Immutable:
  > Immutable objects are values in memory that have fixed spots in memory. This means they always hold the same addresses and object ID's in memory. They are sort of "built-into" your program, decided as to where they will permanently reside in memory. Hence, in our last example where the immutable value of `10` will always maintain the same object ID. </br>
  _`10` happens to be an object ID of `21` (at least in my irb it is)._

  <br>

  When we do assignment to an immutable value we are NOT creating a new space in memory with that value, we are pointing to a designated space in memory for that value.

  <br>

  **Immutable objects in Ruby:**
  -  Booleans
  - `nil`
  - Floats
  - Integers
  - Symbols
  - BigNums
  - FixNums

  <br>

  **Mutable objects in Ruby:**
  - Pretty much everything else.
  - Some exceptions with the use of methods like: Strings becoming immutable with the `freeze` method.

  <br>
  <br>

  We can still mutate mutable objects in Ruby using methods. </br>
  _For example:_
  ```ruby
  a = "words"

  puts " Value of 'a' => #{a} "
  puts "object ID of `a` => #{a.object_id}"

  a.upcase!

  puts " Value of 'a' => #{a} "
  puts "object ID of `a` => #{a.object_id}"  

  ```
  > Same object ID despite us changing the value. We can use these mutating methods to directly reference and modify the value 
  > of a space in memory.