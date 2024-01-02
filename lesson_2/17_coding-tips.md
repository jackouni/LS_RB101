# Coding Tips

1. ## Dramatic Experiences & "Burns"

The main way we commit things to memory is through repetitions and making mistakes.

You can memorize new rules for coding, or come across a "hack" that supposedly helps you become a better programmer, but once we find these new rules or gems, we tend to file them away in the back of our mind, where we forget about them.

**_The truth is :_**
We really solidify things through practice, repetitions and making the mistakes.

A big part of knowing how to debug is by spending those hours searching for silly bugs and going through the pain of debugging for hours.

It's spending time finding the missing commas or semi-colons, recieving that burn is what will commit these experiences to memory and solidify what not to do for you.

This is a big part of committing many things to long term memory.

It's the classic scenario of the kid burning their hand on the hot stove to then be cautious around stoves and to avoid getting burnt again.

**The hours you _"waste"_ are not wasted** - they are hours spent learning a lesson. These are study hours.

Next time you feel like you've wasted time doing things the wrong way or making mistakes, don't think of it as a waste. It's another essential lesson in your journey.

<hr>

2. ## Naming Things

Naming things is a problem you will always be faced with throughout your career.

Sometimes we tend to think that shorter names are favourable due to brevity and cleanliness, but in the long-run, maintenance on bigger applications with many different variable names and many moving parts can be confusing with these shorter variable names.

_Example:_

- `i = gets.chomp`
  - `i` is obviously user input here. But what for? What does it represent?
    Looking at this line of code doesn't really tell us what `i` is asking of representing from the user.
- `input = gets.chomp`
  - Like `i` it still doesn't tell us what it represents.
- `yes_or_no = gets.chomp`
  - This is better.
    We're looking for a 'yes' or 'no' reponse from the user. But what for? And what is in the future we decide to include a 'maybe' or 'most likely' answer. This varaible still doesn't tell us what `yes_or_no` represents.
- `play_again`
  - This is a lot better.
    This gives us a better idea of what the variable represents.

**There is an exception ... _(Or at least something to consider)_**
If we're dealing with small method or loop scopes, then we might want to consider less descriptive variable names, or at least think about it.

Because the life cycle or these variables is shorter and contained to that scope, we rest assure that it's less likely to interfere with other variables outside of the scope, and that it won't leak out or become confusing in the more broad/global scope of our application.

<hr>

3. ## Naming Conventions
Here are some naming rules that Ruby Follows:
  - ### Naming Classes
  When naming classes use `CamelCase`. Uppercase for each new word in a name.
  - ### Naming Constants
  When naming constants (variables that shouldn't be changed or modified) use `ALLCAPS`. This means all uppercase letters.
  - ### Naming Everything Else
  When naming anything other than classes or constants use `snake_case`. Each new word in a name is separated by an underscore.

_**Another thing to note:**_
* Constants can be mutated in Ruby, but we should treat constants like they are immutable.

<hr>

4. ## Methods

Here are some helpful tips for creating methods:
  - ### Keep 'em Short
  Methods should be concise, short, and do one thing. This means we should try to keep our methods below 10-ish lines.

  If we go over 15 then maybe consider splitting the method into two or three methods.
  - ### Displaying Output 🆚 Returning a Value
  Methods should either: return a meaningful value _OR_ display output to the terminal.

  You should **NOT** have a method that both displays an output and returns a meaningful value. 

  Pick one or the other for your method to do.
  - ### Side Effects or Not?
  Decide whether your method should produce side effects or not.

  > A _"side effect"_ is anything where the code outside of a programming scope changes the state of the outer/overall program.
  > _For Example:_ 
  > A method that prints something to the console produces a side effect because we are changing the display of our program - a > part outside of the method's scope/unit.
  > _Another Example:_
  > A method that mutates the value of a varaible outside of the method's scope, is a method that produces a side effect.

  Either your method performs a side effect or returns a meaningful value. It should **NOT** do both.
  - ### `return` is Implied
  In Ruby methods implicitly return a value, so we don't name our methods using descriptors like `return_total(nums)` or `returns_total(nums)` it would just be called `total(nums)`.
  - ### `return` 🆚 Mutating Naming
  Consider that we have our method: `total(nums)`

  Does this method return the sum of `nums` passed or does it mutate the total of the `nums` passed? 
  If you find yourself looking at the method's implementation more often than not, then it might be time to consider changing the method name to be more descriptive. 
  
  _For example:_ 
  `total_of_nums(nums)` could be used to return the total of the `nums` passed.
  While, `update_total(nums)` could be used to mutate the value of `nums` passed.