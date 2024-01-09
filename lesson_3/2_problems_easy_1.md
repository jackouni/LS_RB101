# 1. 
### What would you expect the code below to print out?:
  ```ruby
  numbers = [1, 2, 2, 3]
  numbers.uniq # => [1,3]

  puts numbers # => 1 2 2 3
  ```
  **_ANSWER:_**
  the code will output 1 2 2 3 in sequence
  <hr>

# 2. 
### Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios?

  **_ANSWERS:_**
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
<hr>

# 3. 
### Replace the word "important" with "urgent" in this string:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

  **_ANSWER:_**
  ```ruby
  advice = "Few things in life are as important as house training your pet dinosaur."

  target_word = 'important'
  replacement_word = 'urgent'

  advice_words = advice.split

  advice_words.map! do |word|
    if word == target_word
      replacement_word 
    else 
      word
    end 
  end 

  advice = advice_words.join(" ")

  puts advice
  ```
  A more simple answer:
  ```ruby
  advice.gsub!('important', 'urgent')
  ```

# 4.
### The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:
```ruby
numbers = [1, 2, 3, 4, 5]
```
### What do the following method calls do (assume we reset numbers to the original array between method calls)?
```ruby
numbers.delete_at(1)
numbers.delete(1)
```

  **_ANSWER:_**
  The `delete` method will delete the first item in the caller array that has the same
  value as the argument.
  `delete_at` will delete the item in the caller array with the same index number as the argument.
<hr>

# 5.
### Programmatically determine if 42 lies between 10 and 100.
### hint: Use Ruby's range object in your solution.

  **_ANSWER:_**
  ```ruby 
  if (10..100).include?(target)
    target = 42
    puts "#{target} is between 10 and 100" 
  else
    puts "#{target} is not between 10 and 100"
  end 
  ```

  **_Launch School's Answer:_**
  ```ruby
  (10..100).cover?(42)
  ```
<hr>

# 6. 
### Starting with the string:
```ruby
famous_words = "seven years ago..."
```
### show two different ways to put the expected "Four score and " in front of it.

  **_ANSWERS:_**
  ```ruby
  famous_words = "seven years ago..."
  famous_words = "Four score and " + famous_words 
  ```
  This will also work:
  ```ruby
  famous_words2 = "seven years ago..."
  famous_words2 = "Four score and " << famous_words2
  ```
<hr>

# 7. 
### If we build an array like this:
```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```
We will end up with this "nested" array:
```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```
Make this into an un-nested array.

  **_ANSWER:_**
  ```ruby
  flintstones = ["Fred", "Wilma"]
  flintstones << ["Barney", "Betty"]
  flintstones << ["BamBam", "Pebbles"]
  flintstones.flatten!
  ```
<hr>

# 8.
### Given the hash below:
```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```
### Create an array containing only two elements: Barney's name and Barney's number.

  **_ANSWER:_**
  ```ruby
  flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

  barney = []
  flintstones.each do |key, value|
    if key == "Barney"
      barney.push(key)
      barney.push(value)
    end
  end  

  p barney
  ```
