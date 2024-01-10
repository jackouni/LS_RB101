# <ins>Practice Problems: Medium 1</ins>

## 1. For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:
```
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
```

<br>

#### ANSWER:
```ruby
10.times {|i| puts(" " * i << "The Flintstones Rock!")}
```

<br>
<hr>

## 2. The result of the following statement will be an error:
```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```
### Why is this and what are two possible ways to fix this?

<br>

#### ANSWER:
An error will be produced because you can't concatenate a String object with an Integer object</br>
**_Solution 1:_**
```ruby
puts "the value of 40 + 2 is " + (40 + 2).to_s
```
**_Solution 2:_**
```ruby
puts "the value of 40 + 2 is #{40 + 2}"
```

<br>
<hr>

## 3. Alan wrote the following method, which was intended to show all of the factors of the input number:
```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```

### Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using the begin/end until construct? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

<br>

#### ANSWER:
```ruby
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << (number / divisor) if number % divisor == 0
    divisor -= 1
  end
  factors
end 
```

<br>

### Bonus 1: What is the purpose of the `number % divisor == 0` ?
#### ANSWER:
The purpose of `number % divisor == 0` is to check to see if the number we have is evenly divisble by the divisor. If it equals `0` then we know the divisor divides evenly into the number making it a factor of the number. </br>

### Bonus 2: What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?
The `factors` on line 8 is used to tell our method what to return. In Ruby, the last expression in a method is what is returned unless another expression is explicitly returned using the `return` keyword. In this case, we want to return the `factors` array from the method so we have to place it as the last evaluated expression in the method definition.

<br>
<hr>

## 4. Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.
## She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to concatenate an element to the buffer?
```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```

<br>

#### ANSWER: 
Yes, there is a difference. 
The `<<` operator is mutating the `buffer` argument that is being passed into the method. This means the the `buffer` array in the outer scope will be mutated and will reflect changes made by the method. The method will mutate the array passed and will return the updated array.
<br>

The `+` is non-mutating, meaning the `input_array` passed to the method will not mutate the `input_array` in the outer scope. In this version of the method, the method will not mutate the outer array passed and will only `return` a duplicate of `input_array` as `buffer` and it will relfect the changes made from the method's operations.

<br>
<hr>

## 5. Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

## Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?
```ruby
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

<br>

#### ANSWER:
```ruby
def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
```
> The problem with the original was that `limit` wasn't being accessed. This is because in Ruby methods can't reference variables outside of their scope unless they are passed as arguments to it. In this case I added another parameter `limit` that can now accept a limit for the method to reference.

<br>
<hr>

## 6. What is the output of the following code?
```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

<br>

#### ANSWER:
The output will be `34`. There were no mutations made to the `answer` variable.

<br>
<hr>

## 7. One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:
```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```
## After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:
```ruby
mess_with_demographics(munsters)
```
## Did the family's data get ransacked? Why or why not?

<br>

#### ANSWER: 
It did indeed. `Hash#values` returns an array with all the values in the caller hash => Array#each iterates through each item in the array, in this case each array item is hash from our `munsters` hash, these hashes are direct references to the same hashes in `munsters` => We're then using the mutating methods: `[]+=` and `[]=` and mutating the values in the hashes we iterate through (`family_member`).

<br>

Clarity for me: </br>
You can almost think of it like layers of `object_id`'s. Methods are acting upon the 'top-layer' of `object_id` (`munsters.object_id`), the caller object. Therefore, when we use a non-mutating method on an object that contains a collection of elements we may be creating and returning a new `object_id` but the new `object_id` is still housing the `object_id`'s/references to the elements in the caller object.

<br>
<hr>

## 8. Method calls can take expressions as arguments. Suppose we define a method called rps as follows, which follows the classic rules of rock-paper-scissors game: it returns the winning fist or, in the case of a tie, the fist that both players played.
```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```
## What is the result of the following call?
```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```

<br>

#### ANSWER:
`"paper"` </br>
Let's break it down...</br>
First evaluation:
```ruby
rps(rps(rps("rock", "paper"), "rock"), "rock")
```
> Next evaluation:
```ruby
rps(rps("paper", "rock"), "rock")
```
> Next evaluation:
```ruby
rps("paper", "rock")
```
> Lastly:
```ruby
"paper"
```

<br>
<hr>

## 9. Consider these two simple methods:
```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```
## What would be the return value of the following method invocation?
```ruby
bar(foo)
```

<br>

#### ANSWER:
```ruby
"no"
```

<br>
<hr>

