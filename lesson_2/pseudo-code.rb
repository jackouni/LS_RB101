## ASSIGNMENT:
# Pseudo-code

=begin 
  Pseudo-code is just a way for us humans to abstract the syntactic details of a 
  programming language into a more human-readable language. Then we can later add
  the syntactic details that the language inerpreter can understand.

  For pseudo-code we use english-like language with a little bit of programming syntax
  to illustrate the flow and the problems faced in a program.

  # Example of more abstracted pseudo-code:

    Given a collection of integers.

    Iterate through the collection one by one.
      - save the first value as the starting value.
      - for each iteration, compare the saved value with the current value.
      - if the saved value is greater, or it's the same
        - move to the next value in the collection
      - otherwise, if the current value is greater
        - reassign the saved value as the current value
      After iterating through the collection, return the saved value.
  #

  Some keywords to use:
  START	~ start of the program
  SET	~ sets a variable we can use for later
  GET	~ retrieve input from user
  PRINT	~ displays output to user
  READ	~ retrieve value from variable
  IF / ELSE IF / ELSE	~ show conditional branches in logic
  WHILE	~ show looping logic
  END	~ end of the program

  # Example of less abstracted pseudo-code, using some coding syntax:
    
    Given a collection of integers called "numbers"

    START

    SET iterator = 1
    SET saved_number = value within numbers collection at space 1

    WHILE iterator <= length of numbers
      SET current_number = value within numbers collection at space "iterator"
      IF saved_number >= current_number
        go to the next iteration
      ELSE
        saved_number = current_number

      iterator = iterator + 1

    PRINT saved_number

    END
  #
=end

# As a Ruby program, this is what the pseudo-code example above would translate to:
  def find_greatest(numbers)
    saved_number = numbers[0]

    numbers.each do |num|
      if saved_number >= num
        next
      else
        saved_number = num
      end
    end

    saved_number
  end

  puts "Greatest Number of [1, 60, 100, 12, 101, 4] is '#{find_greatest([1, 60, 100, 12, 101, 4])}'"
#

# "Load the problem into our brain". Sometimes this takes extra time and iteration.

# The two layers of a problem are: 
  # 1) Solving the problem logically
  # 2) Solving the problem syntactically 
#

# Testing my pseudo-code skills:
=begin 
  Write out pseudo-code (both casual and formal) that does the following:
  ------------------------------------------------
  • a method that returns the sum of two integers

    casual:
      - reutrn the value of number 1 and number two added together

    formal:
      START
        PRINT first_number + second_number
      END
=end
def add_nums(num1, num2)
  puts (num1 + num2)
end

add_nums(3, 8)

=begin
  ------------------------------------------------
  • a method that takes an array of strings, and returns a string that is all those strings concatenated together

  casual: 
    - Intialize an empty variable for the concatenated strings
    - Iterate through the array
    - On each iteration add the string item to the concatentated string variable
    - Return the concatenated stirng variable
  
  formal: 
    START
    SET concatenated_string = ""
    EACH string in array
      SET concatenated_string += string

    PRINT concatenated_string
    END  
=end
def concat_strings(array_of_strings)
  concated_string = ""
  array_of_strings.each do |word|
    concated_string += "#{word} "
  end 
  puts concated_string
end

concat_strings(["I", "love", "pseudo-code"])

=begin
  ------------------------------------------------
  • a method that takes an array of integers,
    and returns a new array with every other element from the original array, 
    starting with the first element. For instance:
      every_other([1,4,7,2,5]) # => [1,7,5]

  casual: 
    - Intialize a variable, counter, at 0
    - Intialize a new array variable, as an empty array
    - Loop through each array item - while counter is less than or equal to the index length of the array
      - if the index can evenly divide by 2, then push the array item to the new array - increment counter
      - else, go to next iteration - increment counter
    - Once loop is finished, return new array

  formal: 
    START
    SET counter = 0
    SET new array = []
    WHILE counter < array.length
      IF array[counter] % 2 == 0
        push array[counter] to new array
        increment counter
      ELSE
        increment counter
        next iteration

    PRINT new array
    END
  #
=end
def every_other_array(array)
  counter = 0 
  new_array = []
  while counter < array.length
    new_array.push(array[counter]) if counter.even?
    counter += 1
  end
  p new_array
end 

every_other_array([1,2,3,4,5,6,7,8,9,10])

=begin 
  ------------------------------------------------
  • a method that determines the index of the 3rd occurrence of a given character in a string. 
    For instance, if the given character is 'x' and the string is 'axbxcdxex',the method should return 6 
    (the index of the 3rd 'x'). 
    If the given character does not occur at least 3 times, return nil.

    casual:
      - Initialize a 'character count' variable to 0
      - Initialize 'counter' variable to 0
      - loop through each character in string
        - if string character is equal to target character - increment 'character count' and 'counter' variable 
        - if string character is equal to target character and character count is 3 - print counter variable
        - else, increment 'counter' variable.

    formal:
      START
      SET counter = 0
      SET target count = 0 
      WHILE counter < string.size
        IF target char == string[counter]
         target count += 1
         IF target count == 3
          PRINT counter
          BREAK
         ELSE
          counter += 1
        ELSE 
         counter += 1
      END
    #
=end
def third_index_of_char(character, string)
  counter = 0
  char_count = 0
  while counter < string.size do
    if string[counter] == character
      char_count += 1
      if char_count == 3
        return "Index of third occurance of #{character} is #{counter}"
      else
        counter += 1
      end
    else
      counter += 1
    end 
  end 
  return nil
end 

puts third_index_of_char('x', 'axbxcdxex')
puts third_index_of_char('a', 'aaxbaxcdxex')

=begin  
  • a method that takes two arrays of numbers and returns the result of merging the arrays. 
    The elements of the first array should become the elements at the even indexes of the returned array, 
    while the elements of the second array should become the elements at the odd indexes. For instance:
  #

  casual:
   - intialize 'results array' variable to empty array
   - intialize 'counter' variable to 0
   - while counter is less than array 1's length
      push array 1[counter] to results array
      push array 2[counter] to results array
      counter += 1
    
    - return new array
  
  formal: 
   - SET new_array = []
   - SET counter = 0
   - WHILE counter < array.length
    push array_1[counter] to new_array
    push array_2[counter] to new_array
   - PRINT new_array
  #
=end
def merge_arrays(array_1, array_2) 
  new_array = []
  counter = 0
  while counter < array_1.length do
    new_array.push(array_1[counter])
    new_array.push(array_2[counter])
    counter += 1
  end 

  p new_array
end 

merge_arrays([1, 2, 3], [4, 5, 6])