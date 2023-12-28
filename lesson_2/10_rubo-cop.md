# Rubocop

### A Static Code Analyzer

This means, it is mainly used to enforce style rules for our ruby files/programs.
In rubocop speak:

- Cops
  - Are Rulesets

* Departments
  - Are other sub-groupings of cops

Rubocop is a mix between a style formatter and a bit of code linting.
What are these?

## Style Formatting:

Style formatting is software that makes our code adhere to specific rules that make our
code more readable and focuses on aesthetic and appearance more.

The point of a style formatter is to make our code more consistent.
This can help us maintain a more predictable appearance which can make it easier for ourselves and
others to read.

## Code Linting:

Does perform some style checks like a style formatter, but is more focused on looking for bug-prone code.
This can be software that detects un-assigned/empty variables, syntax errors, and typos and will give an error message
for the specific things it finds.

<hr>

## How to install/set-up Rubocop?

There are 2 methods to installing rubocop onto your machine:

### 1. `gem install`

`$ gem install rubocop --version [desired version]`

In the case of this assignment, we're downloading version `1.51.0`. This is done because the latest versions can sometimes contain bugs, making it more reliable to use a newer, but not too new version.

This assignment:
`$ gem install rubocop --version 1.51.0`

Once you have this installed, you can now use the command `rubocop` in the command line.

We can use `$ rubocop -v` to check to see if we successfully have rubocop installed and can it will tell us the version of rubocop we are using.

<em><strong>But what is happening here?</strong></em> \n
When we run the installation command, we are installing a ruby gem using the ruby package manager.

<ol>
  <li> `gem` tells our system that we're wanting to use the gem package manager.</li>
  <li> `install` tells the package manager to install a gem file/package to our system.</li>
  <li> `rubocop` tells the package manager what file from the gems directory to install.</li>
  <li> `--version` tells the package manager what version of rubocop to install.</li>
</ol>

I had some troubles douwnloading rubocop this way, but with a little bit of digging I was able to figure it out.

In my case I had to manually update the `$PATH` of the terminal (I use .zsh).

The `$PATH` is a directory in the Unix system that your terminal will reference to find a command.
`$PATH` itself is a file that contains a list of file paths to directories all seperated by colons.

When we run a command our terminal will go to the `$PATH` file and look through each of these directories in the list one-by-one until it finds the command that you typed that matches a file in the directory.

By running `echo $PATH` you can see what directories are currently listed. In my case the path to the directory that was storing the rubocop file that our terminal needs to reference, was not included in the `$PATH`.

<em>So what I had to do was add it...</em>

<strong><em>But how do I find the path to rubocop??</em></strong>

You can find it by running the command `gem env` (`env` short for 'enviornment').

This command will bring up a list of specs and information about the currently set-up and enviornment of the version of Ruby on your system.

If you look you will find `EXECUTABLE DIRECTORY`, beside it is the file path to a folder with the 'executables' you will be running (files that your terminal will reference when you type a command).

In my case it looked like this: `/opt/homebrew/lib/ruby/gems/3.2.0/bin`

To confirm that the rubocop executable file was located in this directory I did `cd /opt/homebrew/lib/ruby/gems/3.2.0/bin` and then `ls`. Sure enough, rubocop was located there.

So, I opened up `$PATH` and added this directory.

To the end of the file, simply add:
`export PATH="/file/path/to/my/executables/directory:$PATH"`

Save.
Close file.
Quit your terminal.
Reopen your terminal.

There's my work around for making that function!

### 2. `Gemfile` method

With this method you don't need to use the `gem install` command.

A Gemfile is a file that your bundler references to manage dependencies.

In simple, this just means it makes sure that libraries and packages that our project is dependent on don't have conflicts and keep things consistent throughout different development environments, allowing a way for other developers to see what packages a project is using and an easy way for them to download those dependencies.

How do we create a Gemfile then?
Simple:

1. create a file in the repo or directory you want to have rubocop in.
   `touch Gemfile`

2. Add this to the file:

```ruby
source 'https://rubygems.org'

group :development do
  gem 'rubocop', '1.51.0'
end
```

3. Done!

<hr>

## How to Use Rubocop?

Now that we have rubocop installed how do we use it?

If you used method 1 with `gem install` then all you need to do is run the command `rubocop your-file.rb` in your terminal and rubocop will execute on that file.

If you used method 2 with a `Gemfile` then you need to run `bundle exec rubocop your-file.rb` in your terminal and rubocop will execute on that file

When you run rubocop it will show you:

- How many files it inspected
- The type of offense (C ~ <em>convention</em>, W ~ <em>warning</em>, E ~ <em>error</em>, F ~ <em>fatal</em>)
- Offenses committed
- Offenses contain:
  - the name of the file it was found in
  - The line number and column number
  - The type of offense
  - The name of the offense
  - A display of the code where it found the error

## Configuring Rubocop

Maybe we don't want rubocop to be as strict? Or maybe we want to it to more strict and enforce more rules? Or maybe we want it to enforce custom rules?

Well, we can customize rubocops behaviour and output by configuring it.

To configure rubocop we need to create a config file that rubocop can reference whenever it runs.

This will be a `.rubocop.yml` file.

Create this `.rubocop.yml` file in the directory/repo you'll be working in.

For our case in this assignment we'll be adding this to the `.rubocop.yml` file:

```yml
# .rubocop.yml for RB101 Lessons 2-3 (06 June 2023)

AllCops:
  # Enable all new cops
  NewCops: enable
  # Display cop names
  DisplayCopNames: true
  # Display Extra details
  ExtraDetails: true
  # Style guide URLs are not displayed in offense messages by default. Change
  # behavior by overriding DisplayStyleGuide, or by giving the
  # -S/--display-style-guide option.
  DisplayStyleGuide: true
  # When specifying style guide URLs, any paths and/or fragments will be
  # evaluated relative to the base URL.
  StyleGuideBaseURL: https://rubystyle.guide/
  # What version of the Ruby interpreter is the inspected code intended to
  # run on? (If there is more than one, set this to the lowest version.)
  TargetRubyVersion: 2.4

Style/BlockComments:
  Description: "Do not use block comments."
  Enabled: false

Style/CommandLiteral:
  Description: "Use `` or %x around command literals."
  Enabled: true
  # backticks: Always use backticks.
  # percent_x: Always use %x.
  # mixed: Use backticks on single-line commands, and %x on multi-line commands.
  EnforcedStyle: mixed
  SupportedStyles:
    - backticks
    - percent_x
    - mixed
  # If false, the cop will always recommend using %x if one or more backticks
  # are found in the command string.
  AllowInnerBackticks: false

Style/CommentAnnotation:
  Description: >-
    Checks formatting of special comments (TODO, FIXME, OPTIMIZE, HACK, REVIEW).
  Enabled: false

Style/Documentation:
  Description: "Document classes and non-namespace modules."
  Enabled: false

Style/DoubleNegation:
  Description: "Checks for uses of double negation (!!)."
  Enabled: false

Layout/EmptyLineBetweenDefs:
  Enabled: true
  AllowAdjacentOneLineDefs: true

Style/EmptyLiteral:
  Description: Prefer literals to Array.new/Hash.new/String.new.
  Enabled: false

Style/FrozenStringLiteralComment:
  Enabled: false
  Description: Require the addition of the frozen string literal comment.

Style/GuardClause:
  Description: Check for conditionals that can be replaced with guard clauses.
  Enabled: false

Style/HashSyntax:
  Description: >-
    Prefer Ruby 1.9 hash syntax { a: 1, b: 2 } over 1.8 syntax
    { :a => 1, :b => 2 }.
  Enabled: true
  EnforcedStyle: ruby19_no_mixed_keys
  UseHashRocketsWithSymbolValues: false
  PreferHashRocketsForNonAlnumEndingSymbols: false

Style/IfUnlessModifier:
  Description: >-
    Favor modifier if/unless usage when you have a
    single-line body.
  Enabled: false

Style/InlineComment:
  Description: Avoid inline comments.
  Enabled: false

Style/MethodCallWithoutArgsParentheses:
  Description: Do not use parentheses for method calls with no arguments.
  Enabled: false

Style/ModuleFunction:
  Description: Checks for usage of `extend self` in modules.
  Enabled: false

Style/MutableConstant:
  Description: Freeze mutable constants.
  Enabled: false

Style/NegatedIf:
  Description: >-
    Favor unless over if for negative conditions
    (or control flow or).
  Enabled: false

Style/NegatedWhile:
  Description: "Favor until over while for negative conditions."
  Enabled: false

Style/Next:
  Description: "Use `next` to skip iteration instead of a condition at the end."
  Enabled: false

Style/NumericLiterals:
  Description: Add underscores to large numeric literals to improve their readability.
  Enabled: false

Style/NumericPredicate:
  Description: >-
    Checks for the use of predicate- or comparison methods for
    numeric comparisons.
  Enabled: false

Style/OneLineConditional:
  Description: Favor the ternary operator(?:) over if/then/else/end constructs.
  Enabled: false

Naming/BinaryOperatorParameterName:
  Description: When defining binary operators, name the argument other.
  Enabled: false

Style/ParenthesesAroundCondition:
  Description: >-
    Don't use parentheses around the condition of an
    if/unless/while.
  Enabled: true
  AllowSafeAssignment: false

Style/PercentLiteralDelimiters:
  Description: "Use `%`-literal delimiters consistently"
  Enabled: false

Style/PerlBackrefs:
  Description: Avoid Perl-style regex back references.
  Enabled: false

Style/Proc:
  Description: Use proc instead of Proc.new.
  Enabled: false

Style/RedundantFetchBlock:
  Description: Only way to keep FetchBlock warning from popping up.
  Enabled: true

Style/RedundantParentheses:
  Enabled: false

Style/RedundantReturn:
  Description: "Don't use return where it's not required."
  Enabled: true
  # When true allows code like `return x, y`.
  AllowMultipleReturnValues: true

Style/RegexpLiteral:
  Description: "Use / or %r around regular expressions."
  Enabled: true
  EnforcedStyle: mixed
  AllowInnerSlashes: false

Style/SafeNavigation:
  Description: >-
    This cop transforms usages of a method call safeguarded by
    a check for the existance of the object to
    safe navigation (`&.`).
  Enabled: false

Style/SingleLineBlockParams:
  Description: Enforces the names of some block params.
  Enabled: false

Style/SingleLineMethods:
  Description: Avoid single-line methods.
  Enabled: false

Layout/SpaceAroundEqualsInParameterDefault:
  Enabled: false

Style/StringLiterals:
  Description: Force use of single or double quotes when no interpolation
  Enabled: false

Style/SymbolArray:
  Description: "Use %i or %I for arrays of symbols."
  StyleGuide: "#percent-i"
  Enabled: false

Style/WhileUntilModifier:
  Description: Favor modifier while/until usage when you have a single-line body.
  Enabled: false

Style/WordArray:
  Description: "Use %w or %W for arrays of words."
  Enabled: false

Metrics/AbcSize:
  Description: >-
    A calculated magnitude based on number of assignments,
    branches, and conditions.
  Enabled: true
  Max: 18

Metrics/BlockLength:
  Description: Limit size of blocks.
  Enabled: false

Metrics/ClassLength:
  Description: "Avoid classes longer than 100 lines of code."
  Enabled: false

Layout/LineLength:
  Description: Limit lines to 80 characters.
  Enabled: true
  Max: 80
  StyleGuide: https://rubystyle.guide/#80-character-limits
  AllowURI: true
  URISchemes:
    - http
    - https

Metrics/MethodLength:
  Description: "Avoid methods longer than 15 lines of code."
  Enabled: true
  CountComments: false # count full line comments?
  Max: 15

Lint/LiteralInInterpolation:
  Description: "Avoid interpolating literals in strings"
  AutoCorrect: false
  Enabled: true

Layout/EmptyLinesAroundAttributeAccessor:
  Description: "Checks for a newline after an attribute accessor or a group of them."
  Enabled: true

Layout/SpaceAroundMethodCallOperator:
  Description: "Checks method call operators to not have spaces around them."
  Enabled: true

Lint/DeprecatedOpenSSLConstant:
  Description: "Algorithmic constants for OpenSSL::Cipher and OpenSSL::Digest deprecated since OpenSSL version 2.2.0. Prefer passing a string instead."
  Enabled: false

Lint/MixedRegexpCaptureTypes:
  Description: "Do not mix named captures and numbered captures"
  Enabled: false

Lint/RaiseException:
  Description: "Checks for raise or fail statements which are raising Exception class."
  Enabled: false

Lint/StructNewOverride:
  Description: "Checks unexpected overrides of the Struct built-in methods via Struct.new"
  Enabled: false

Style/ExponentialNotation:
  Description: "Enforces consistency when using exponential notation for numbers in the code"
  Enabled: false

Style/HashTransformKeys:
  Description: "Tries to use a simpler & faster call to transform_keys where possible"
  Enabled: false

Style/HashTransformValues:
  Description: "Tries to use a simpler & faster call to transform_values where possible"
  Enabled: false

Style/RedundantRegexpCharacterClass:
  Description: "Checks for unnecessary single-element Regexp character classes."
  Enabled: false

Style/RedundantRegexpEscape:
  Description: "Checks for redundant escapes inside Regexp literals"
  Enabled: false

Style/SlicingWithRange:
  Description: "Checks that arrays are sliced with endless ranges instead of ary[start..-1]"
  Enabled: false

Style/FormatStringToken:
  Description: "Use a consistent style for named format string tokens."
  Enabled: false

Layout/EmptyLineAfterGuardClause:
  Description: "Requires empty line after guard clause"
  Enabled: false

Style/FloatDivision:
  Description: "Checks for division with integers coerced to floats."
  Enabled: false

Naming/MethodParameterName:
  Description: "Parameter names at least 3 characters long"
  Enabled: false

Style/ConditionalAssignment:
  Description: "Use return value of conditional for assignment"
  Enabled: false

Naming/AccessorMethodName:
  Description: "Do not prefix reader method names with get_"
  Enabled: false

Style/NegatedUnless:
  Description: "Favor if over unless"
  Enabled: false

Style/MultipleComparison:
  Description: "Avoid comparing variable with multiple items"
  Enabled: false

Layout/HeredocIndentation:
  Description: "Checks the indentation of the here document bodies"
  Enabled: false

Layout/ClosingHeredocIndentation:
  Description: "Checks the indentation of here document closings."
  Enabled: false

Style/CommentedKeyword:
  Description: "Comments should not be on same line as def"
  Enabled: false

Style/HashEachMethods:
  Description: "each_key over keys.each"
  Enabled: false

Style/MultilineWhenThen:
  Description: "Avoid then for multiline when statement"
  Enabled: false

Style/InverseMethods:
  Description: "reject instead of reversed select"
  Enabled: false

Style/ZeroLengthPredicate:
  Description: "empty? instead of length == 0"
  Enabled: false
```
