# Flowchart

We can use flowcharts to organize and illustrate the control flow of an application.
The flowcharts are generally used to supplement pseudo-code and really helps with abstracting the process.

Trying to create flowcharts and pseudo-code can get a little tough, deciding what parts we include and what complexities we want to abstract out can be hard. The idea is to give a higher level overview of the application flow, so we sometimes could just include methods or titles in our pseudo-code and flowchart that represent a whole other sub-process and on separate pseudo-code or flowcharts we can figure out those sub-processes. Deciding what sub-processes to have written out in full can be hard, and it's apart of the problem solving.

### Here are some common symbols we can use in our flowchart diagrams:

<img src="lesson_2/images/flowchart_components.jpg">

### Here's some pseudo-code from the last assignment:

```ruby
=begin

  A method that takes two arrays of numbers and returns the result of merging the arrays.
  The elements of the first array should become the elements at the even indexes of the returned array,
  while the elements of the second array should become the elements at the odd indexes:

 Formal Pseudo-code:

  - SET new_array = []
  - SET counter = 0
  - WHILE counter < array.length
      push array_1[counter] to new_array
      push array_2[counter] to new_array
      counter += 1
  - PRINT new_array

=end
```

### Here's what the above code would look like as a flowchart:

<img src="lesson_2/images/flowchart-diagram.drawio.png">
