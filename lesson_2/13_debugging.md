# Debugging

Most of being a programmer is fixing things that are broken. While the fame goes to making things, the majourity of coding is debugging.

A good attitude for debugging is to approach problems (of any kind) with a systematic programmer's approach.

This means looking for solutions and taking a solution-focused approach to problems.

If you miss the bus and get a sinking feeling that makes you go home and lie in bed instead, then you may need to work on your reaction to problems.

Whereas a programmer, would look at the options infront of them and work through which option is the best solution and go for it.

In the case of missing a bus a programmer might see...
Here are my options:

1. When does the next bus come? I could wait for it.
2. Are there alternative bus routes to get to my destination?
3. Is there an alternate form of transportation I can use and where?

And from there analyze those options to see which is the most viable based on time constraints and details of the problem.

So to develop a patient, solution focused temperament is important to becoming a professional and competent dev.

<hr>

## The Stack Trace

<em><strong>What is the stack trace?</strong></em>

The stack trace is a string of text that is displayed that shows you errors encountered in your code and where they are located.

The stack trace will display the name/title of the error followed by the details of the method and/or variable it applies to.

Afterwards, there will be lines of `from user/name/project/file.rb:80:10: in `method_name``
Let's disect this:

- 1st part `from project/file-path/file.rb ...`
  - Tells you from what file the error is coming from given the exact file path.
- 2nd part `:line:column:`
  - This part tells you from what line in that file and what column the error is coming from.
- 3rd part `in `method_name``
  - Tells you what method the error occured in.

As you continue down the lines each new line tells you where the previous method was called from.
It creates a chain or a <em>stack</em> of methods that were called leading up the call.

In english-pseudo-code it's like saying:
"The error occured from this file, on this line and this column, and it occured in this method. And that method was called from this file, on this line and this column, and it occured in this method. And that method was called from ...."

Each line tells you where the last was called from.

<hr>

## Resources for Debugging:

1. Google/Search Engine
2. Stack Overflow
3. Documentation
4. ChatGPT (Verify its answers first though)

<hr>

## Steps to Debugging

### 1. Reproduce the Error

One of the first steps of debugging a problem is to see if we can reproduce that error.

This means we're able to sythetically recreate the error message and the problem we've encountered.

By doing this we've demonstrated that we understand the problem, how it's made and potentially how to solve it.

### 2. Determine the Boundaries of the Error

Let's figure out where the boundaries are in our error.

This means that we should experiment with the source of the error message and see what other or no error we can get from modifying the varaibles, methods, modules, etc.

Example:

Let's say we get an error message coming from
`people.names += data`

Is the error coming from the `people` object? Is it coming from `names`? Or is it a problem with `data`?

- Maybe we can call `people` on its own and see if we get an error. Could be a problem with the `people` object?
- We could try accessing `people.names` to determine if it's a problem with the property itself or a problem with the reassignment of `data` to it.
- Possibly, we might try accessing `data` or messing around with it and seeing if it generates any errors?
- Let's try reassigning a difference variable to `people.names` and seeing if that generates an error or not?

By figuring out the 'scope' or 'boundaries' of our problem we can better narrow-in and determine what the potential cause is.

### 3. Trace the Code

Let's trace the code. First let's trace through each call and see if we diagnose the problem.

### 4. Understand the Problem

We can now try to go through each call or each section of the problem and see what the values and methods return to us.

_Example:_

```ruby
def first_word(sentence)
  sentence.split(" ")[0]
end

puts first_word("Hello World!") # => "Hello"
```

This method above, it works, but let's say we wanted to debug it and understand it.

1st Let's see what is returned from just `sentence`:

```ruby
def first_word(sentence)
  sentence
end

p first_word("Hello World!") # => "Hello World!"
```

Ok, that `sentence` returns what it should be returning on its own.

_Notice I used `p` method to get a more accurate view of what's being returned, whereas `puts` just prints out strings to a terminal._

Let's see what that `split` method returns:

```ruby
def first_word(sentence)
  sentence.split
end

p first_word("Hello World!") # => ["Hello", "World!"]
```

Ok, the `split` method returns what we expected, an array of the words in the sentence.

Now, we can add the `" "` as an argument to see what is returned.
_For sake of brevity it'll return the same thing as the last step._

Now we can try and accessing elements from the array that is returned from the `sentence.split(" ")` and see what we get:

```ruby
def first_word(sentence)
  sentence.split(" ")
end

puts first_word("Hello World!")[0] # => "Hello"
puts first_word("Hello World")[1] # => "World"
```

See how we can break down our methods and sample each part in sequence to figure out how it works overall?

This is apart of understanding the problem.

### 5. Implement a Fix

### 6. Test the Fix

<hr>
