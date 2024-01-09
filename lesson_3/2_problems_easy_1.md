# <ins>Practice Problems: Easy 1</ins>

## 1. What would you expect the code below to print out?
```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```
<br>

#### _ANSWER:_
  ```ruby
  numbers = [1, 2, 2, 3]
  numbers.uniq

  puts numbers # Print each number from numbers to the terminal:
  # 1
  # 2
  # 2
  # 3
  ```
  > This only prints the original numbers from `numbers` because the `#uniq` method does not mutate the caller object, it only returns the result of its operation.
  
  <br>
  <hr>

## 2. Describe the difference between ! and ? in Ruby.
### And explain what would happen in the following scenarios:
1. what is != and where should you use it?
2. put ! before something, like !user_name
3. put ? before something
4. put ! after something, like words.uniq!
5. put ? after something
6. put !! before something, like !!user_name

<br>

#### _ANSWERS:_
1. `!=` is the '_not_ equal' or 'inequality' comparison operator. As a binary operator it takes 2 operands and compares them, if the operands are not equal in value `true` is returned, otherwise, `false` is returned.
```ruby
user_name = "big_boy_12"

user_name != 10           #=> true
user_name != "big_boy_12" #=> false

```
<br>

2. `!` prepended to a variable or object is the 'NOT' operator. As a unary operator it takes 1 operand (the object it is prepended to) and negates the truthy/falsy value of the operand, if an operand is considered truthy, false is returned, if falsy, true is returned.
```ruby
user_name = "big_boy_12"

!user_name #=> false (everything except `nil` and `false` are truthy)
!nil       #=> true
```
<br>

3. `!` at the end of a method name is called a 'bang'. By general naming convention in Ruby, this means that the method is destructive and will mutate the caller object.
```ruby
user_name = "big_boy_12"

user_name.upcase  #=> BIG_BOY_12
user_name         #=> big_boy_12 (no mutation)

user_name.upcase! #=> BIG_BOY_12
user_name         #=> BIG_BOY_12 (is mutated)
```
<br>

4. `?` before something isn't a convention of any kind and won't do anything but possibly raise an error. This could potentially be used in a ternary operator? 
<br>
<br>

5. `?` at the end of a method name is a general naming convention in Ruby. It means that the method will return a boolean.
```ruby
user_name = "big_boy_12"

user_name.include?('big') #=> true
user_name.include?('hey') #=> false
```
<br>

6. `!!` prepending a variable or expression means "not not", you're negating the truthy/falsy value of the effected object and then negating it again. This is a common way of getting an object's truthy/falsy value.
```ruby
user_name = "big_boy_12"

!!user_name #=> true
!!nil       #=> false
```
<br>
<hr>

## 3. Replace the word "important" with "urgent" in this string:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
<br>

#### _ANSWER:_
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')
```
<br>
<hr>

## 4. The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:
```ruby
numbers = [1, 2, 3, 4, 5]
```
### What do the following method calls do (assume we reset numbers to the original array between method calls)?
```ruby
numbers.delete_at(1)
numbers.delete(1)
```
<br>

#### _ANSWER:_
```ruby
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) #=> [1, 3, 4, 5]
```
_**And**_ 
```ruby
numbers = [1, 2, 3, 4, 5]

numbers.delete(1) #=> [2, 3, 4, 5]
```
<br>
<hr>

## 5. Programmatically determine if 42 lies between 10 and 100.

#### _ANSWER:_
```ruby
(10..100).include?(42)

# or this...
(10..100).cover?(42)
```
<br>
<hr>







