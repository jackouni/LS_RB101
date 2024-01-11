# Practice Problems: Hard 1
<br>

## 1. What do you expect to happen when the greeting variable is referenced in the last line of the code below?
```ruby
if false greeting = "hello world"
greeting
```
<br>

#### ANSWER:
`greeting` will return `nil`. This is because even though the `greeting = "hello world"` is never intialized due to the 'if' statement not executing, because it is initialized in the an if/else it will be given a value of `nil`, regardless of if it is executed or not. That's why this code doesn't throw an error. Normally when you reference an intialized variable Ruby will throw an error, but in this case it won't.

<br>
<hr>

## 2. What is the result of the last line in the code below?
```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```
<br>

#### ANSWER:
I belive `greetings` will puts `{ a: 'hi there' }`. This is happening because `informal_greeting`` is referencing the value of the key `:a` in `greetings` and we are then mutating that value with `informal_greeting << ' there'`.

<br>
<hr>

## 4. In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

## To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

## What will be printed by each of these code groups?

## A
```ruby
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

#### ANSWER A:
The code printed will be:
```
one is: one
two is: two
three is: three
```
<br>

## B
```ruby
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

#### ANSWER B:
The code printed will be:
```
one is: one
two is: two
three is: three
```
<br>

## C
```ruby
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"
```

#### ANSWER C:
The code printed will be:
```
one is: two
two is: three
three is: one
```
<br>
<hr>

## 4. Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.
```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
```
## Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

## Help Ben fix his code.
<br>

#### ANSWER:
```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size == 4
    dot_separated_words.each do |word|
      unless is_an_ip_number?(word)
        return false
      end
    end
    true 
  else
    false
  end 
end
```
**_Second answer:_**
```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  return false if dot_separated_words.size != 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end
```
**_Another one:_**
```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")

  return false unless dot_separated_words.size == 4
  result = nil
  dot_separated_words.each {|word| is_an_ip_number?(word) ? result = true : result = false}
  result
end
```