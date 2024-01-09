# 1. 
### In this hash of people and their age,
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```
### see if "Spot" is present.</br>
### **Bonus**: What are two other hash methods that would work just as well for this solution?
</br>

  **_ANSWERS:_**</br>
  ```ruby
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

  target = "Spot"
  case ages.has_key?(target)
  when true
    puts "#{target} is found."
  when false
    puts "#{target} is not found."
  end 
  ```
  **_You can also use `include?`, `member?` and `key?`_**
  ```ruby
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

  target = "Spot"
  
  ages.include?(target) # => false

  ages.member?(target)  # => false

  ages.key?(target)     # => false
  ```
<hr>

# 2. 
### Starting with this string:
```ruby
munsters_description = "The Munsters are creepy in a good way."
```
### Convert the string in the following ways (code will be executed on original munsters_description above):
```ruby
1. "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
2. "The munsters are creepy in a good way."
3. "the munsters are creepy in a good way."
4. "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

  **_ANSWERS:_**</br>
  ```ruby
  munsters_description = "The Munsters are creepy in a good way."

  puts munsters_description.swapcase
  puts munsters_description.capitalize
  puts munsters_description.downcase
  puts munsters_description.upcase
  ```
<hr>

# 3. 
### We have most of the Munster family in our age hash:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```
### add ages for Marilyn and Spot to the existing hash
```ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```
  **_ANSWERS:_**</br>
  ```ruby
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
  additional_ages = { "Marilyn" => 22, "Spot" => 237 }

  ages.merge!(additional_ages)
  ```
<hr>

# 4. 
### See if the name "dino" appears in the string below:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

  **_ANSWERS:_**</br>
  ```ruby
  advice = "Few things in life are as important as house training your pet dinosaur."
  advice.include?("dino")
  ```
  **_Or this:_**
  ```ruby
  advice = "Few things in life are as important as house training your pet dinosaur."
  advice.match?("dino")
  ```
<hr>

# 5. 
### Show an easier way to write this array:
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```
<br>

  **_ANSWERS:_**</br>
  ```ruby
  flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]
  ```
<hr>

# 6. 
### How can we add the family pet "Dino" to our usual array:
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

  **_ANSWERS:_**</br>
  ```ruby
  flintstones.push('Dino')
  ```
  **_Or this works:_**
  ```ruby
  flintstones << 'Dino'
  ```
<hr>

# 7. 
### In the previous practice problem we added Dino to our array like this:
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```
### We could have used either Array#concat or Array#push to add Dino to the family.
### How can we add multiple items to our array? (Dino and Hoppy)

  **_ANSWERS:_**</br>
  ```ruby
  flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
  flintstones.push('Dino', 'Hoppy')
  ```
<hr>

# 8.
### Shorten the following sentence:
```ruby
 advice = "Few things in life are as important as house training your pet dinosaur."
```
### Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".
 
### As a bonus, what happens if you use the String#slice method instead?

  **_ANSWERS:_**</br>
  ```ruby
  advice = "Few things in life are as important as house training your pet dinosaur."
  advice = advice.slice(39..)
  ```
  _If you used `slice!` you would mutate the `advice` object. This means you wouldn't have to use the `=` operator like in the answer above that I gave. _
  **_Example:_**
  ```ruby
  advice = "Few things in life are as important as house training your pet dinosaur."
  advice.slice!(39..)
  ```
<hr>

# 9.
### Write a one-liner to count the number of lower-case 't' characters in the following string:
```ruby
statement = "The Flintstones Rock!"
```
  **_ANSWERS:_**</br>
  ```ruby
  statement = "The Flintstones Rock!"
  statement.count "t"
  ```
  **_For fun - Without using `count`:_**
  ```ruby
  statement = "The Flintstones Rock!"
  count = 0
  statment.chars.each {|char| char == 't' ? count += 1 : next}
  puts count
  ```
<hr>

# 10.
### Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a table of Flintstone family members that was forty characters in width, how could we easily center that title above the table with spaces?
```ruby
title = "Flintstone Family Members"
```

  **_ANSWERS:_**</br>
  ```ruby
  title = "Flintstone Family Members"
  title.center(40)
  ```

