# <ins>Practice Problems: Medium 2</ins>

## 1. Every object in Ruby has access to a method called object_id, which returns a numerical value that uniquely identifies the object. This method can be used to determine whether two variables are pointing to the same object.

## Take a look at the following code and predict the output:
```ruby
a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id
```
<br>

#### ANSWER:
`c` will output the same object id value as `a` to the terminal. `b` will have a different object id.

<br>
<hr>

## 2. Let's take a look at another example with a small difference in the code:
```ruby
a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id
```
<br>

#### ANSWER:
The object id's will be different from the last example. `a`, `b` and `c` will output the same object id's to the terminal. This is because Integers are immutable objects, meaning they are objects that will always hold the same place in memory, variables just point to them, they don't modify them or create new ones from assignment or reassignment.

<br>
<hr>

## 3. Let's call a method, pass two strings as arguments and see how they can be treated differently depending on the method invoked on them inside the method definition.

## Study the following code and state what will be displayed...and why:
```ruby
def tricky_method(string_param_one, string_param_two)
  string_param_one += "rutabaga"
  string_param_two << "rutabaga"
end

string_arg_one = "pumpkins"
string_arg_two = "pumpkins"
tricky_method(string_arg_one, string_arg_two)

puts "String_arg_one looks like this now: #{string_arg_one}"
puts "String_arg_two looks like this now: #{string_arg_two}"
```
<br>

#### ANSWER:
The output will be:
```ruby
puts "String_arg_one looks like this now: #{string_arg_one}" #=> pumpkins
puts "String_arg_two looks like this now: #{string_arg_two}" #=> pumpkinsrutabaga
```
> This happens be the `+=` operator is a non-mutating method. This means it'll create a new value in a new place in memory and point to it. Whereas `<<` is mutating. This means it will directly change the object held in memory that the variable points to. This is why after the method runs, `string_arg_one` does not change in value and why `string_arg_two` does change in value.

<br>
<hr>

## 4. To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the user's version of it.
```ruby
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
<br>

#### ANSWER:
The output will be:
```ruby
puts "My string looks like this now: #{my_string}" #=> pumpkinsrutabaga
puts "My array looks like this now: #{my_array}"   #=> ["pumpkins"]
```
> The array is using the assignment operator which is a non-mutating operation. This means the assignment operator simply changes the place in memory its referencing and puts in a new object there. In the method, the second argument is locally scoped, it's a duplicate of the reference `my_array` which point to `["pumpkins"]`, this means that when we reassign the array argument it does not mutate the original, it is simply changing it's reference and creating a new value.

<br>
<hr>

## 5. Depending on a method to modify its arguments can be tricky:
```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
## Whether the above "coincidentally" does what we think we wanted depends upon what is going on inside the method.

## How can we change this code to make the result easier to predict and easier for the next programmer to maintain? That is, the resulting method should not mutate either argument, but my_string should be set to 'pumpkinsrutabaga' and my_array should be set to ['pumpkins', 'rutabaga']

<br>

#### ANSWER:
There's a few things we can do to achieve this;
1. We can make the methods in the array non-mutating.
2. We can separate this into two different methods.
3. We can name them more appropriately. 
4. We can also just assign the variables to the method calls afterwards. As opposed to mutation.

Here's my update:
```ruby
my_string = "pumpkins"
my_array = ["pumpkins"]

def add_rutabaga_to_string(a_string_param)
  a_string_param += "rutabaga"
end

def add_rutabaga_to_array(an_array_param)
  an_array_param + ["rutabaga"]
end

my_string = add_rutabaga_to_string(my_string)
my_array = add_rutabaga_to_array(my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

<br>
<hr>

## 6. How could the following method be simplified without changing its return value?
```ruby
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
```
<br>

#### ANSWER:
```ruby
def color_valid(color)
  color == "blue" || color == "green"
end
```