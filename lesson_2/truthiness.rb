# Reviewing Truthiness & Falsiness in Ruby

true.class          # => TrueClass
true.nil?           # => false
true.to_s           # => "true"
true.methods        # => list of methods you can call on the true object

false.class         # => FalseClass
false.nil?          # => false
false.to_s          # => "false"
false.methods       # => list of methods you can call on the false object

# The following will all output 'false':
puts "Hello" == true
puts 1 == true
puts 1.5 == true
puts [] == true
puts [1,2,3] == true
puts {} == true
puts {:num => 12} == true
# This is because, although Ruby considers any values other than nil and false
# to be truthy, it does not evaluate truthy to be **true**. 
# Only `true == true` will ever be truly **true** (haha).
