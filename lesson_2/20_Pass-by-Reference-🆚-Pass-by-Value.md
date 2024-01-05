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