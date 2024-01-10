# <ins>Practice Problems: Easy 2</ins>

## 1. In this hash of people and their age,
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```
## see if "Spot" is present.

### Bonus: What are two other hash methods that would work just as well for this solution?

<br>

#### _ANSWER:_

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# Any of these will work:
ages.include?('Spot')
ages.key?('Spot')
ages.has_key?('Spot')
ages.member?('Spot')
```

<br>
<hr>

## 2. Starting with this string:
```ruby
munsters_description = "The Munsters are creepy in a good way."
```
### Convert the string in the following ways (code will be executed on original munsters_description above):
```
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

<br>

#### _ANSWER:_

```ruby
munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase   #=> "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.capitalize #=> "The munsters are creepy in a good way."
munsters_description.downcase   #=> "the munsters are creepy in a good way."
munsters_description.upcase     #=> "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

<br>
<hr>

## 3. We have most of the Munster family in our age hash:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```
### add ages for Marilyn and Spot to the existing hash
```ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```

<br>

#### _ANSWER:_

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
```

<br>
<hr>

## 4. See if the name "dino" appears in the string below:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

<br>

#### _ANSWER:_

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."

# Either of these work:
advice.include?('dino')
advice.match?('dino')
```

<br>
<hr>

## 5. Show an easier way to write this array:
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```

<br>

#### _ANSWER:_

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

<br>
<hr>

## 6. How can we add the family pet "Dino" to our usual array:
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

<br>

#### _ANSWER:_

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```
**_Or this..._**
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino")
```

<br>
<hr>

## 7. In the previous practice problem we added Dino to our array like this:
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```
### We could have used either Array#concat or Array#push to add Dino to the family.
### How can we add multiple items to our array? (Dino and Hoppy)

<br>

#### _ANSWER:_

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstone.push('Dino', 'Hoppy')
```
**_Fun way:_**
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstone.push(["Dino", "Hoppy"]).flatten!
```
**_Anotha one:_**
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstone << 'Dino' << 'Hoppy'
```
**_Anotha one:_**
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstone.concat(%w(Dino Hoppy))
```

<br>
<hr>

## 8. Shorten the String:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
### Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". 
### But leave the advice variable as "house training your pet dinosaur.".

### As a bonus, what happens if you use the String#slice method instead?

<br>

#### _ANSWER:_

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
index = advice.index('house')
advice.slice!(0, index)
```

<br>
<hr>

## 9. Write a one-liner to count the number of lower-case 't' characters in the following string:
```ruby
statement = "The Flintstones Rock!"
```

<br>

#### _ANSWER:_

```ruby
statement = "The Flintstones Rock!"
statement.count('t')
```

<br>
<hr>

## 10. Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a table of Flintstone family members that was forty characters in width, how could we easily center that title above the table with spaces?
```ruby
title = "Flintstone Family Members"
```

<br>

#### _ANSWER:_

```ruby
title = "Flintstone Family Members"
title.center(40)
```

<br>
<hr>