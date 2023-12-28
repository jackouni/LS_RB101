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

## How to install Rubocop?

There are 2 methods to installing rubocop onto your machine:

Through the use of...

`$ gem install rubocop --version [desired version]`

In the case of this assignment, we're downloading version `1.51.0`. This is done because the latest versions can sometimes contain bugs, making it more reliable to use a newer, but not too new version.

This assignment:
`$ gem install rubocop --version 1.51.0`

Once you have this installed, you can now use the command `rubocop` in the command line.

We can use `$ rubocop -v` to check to see if we successfully have rubocop installed and can it will tell us the version of rubocop we are using.

<em><strong>But what is happening here?</strong></em>
When we run the installation command, we are installing a ruby gem using the ruby package manager.

<ol>
  <li>`gem` tells our system that we're wanting to use the gem package manager.</li>
  <li>`install` tells the package manager to install a gem file/package to our system.</li>
  <li>`rubocop` tells the package manager what file from the gems directory to install.</li>
  <li>`--version` tells the package manager what version of rubocop to install.</li>
</ol>

I had some troubles douwnloading rubocop this way, but with a little bit of digging I was able to figure it out.

In my case I had to manually update the `$PATH` of the terminal (I use .zsh).
The `$PATH` is a directory in the Unix system that your terminal will reference to find a command.
`$PATH` itself is a file that contains a list of file paths to directories all seperated by colons.
When we run a command our terminal will go to the `$PATH` file and look through each of these directories in the list one-by-one until it finds the command that you typed that matches a file in the directory.
By running `echo $PATH` you can see what directories are currently listed. In my case the path to the directory that was storing the rubocop file that our terminal needs to reference, was not included in the `$PATH`.
So what I had to do was add it.

<em>But how do I find the path to rubocop??</em>
You can find it by running the command `gem env` (`env` short for 'enviornment'). This command will bring up a list of specs and information about the currently set-up and enviornment of the version of Ruby on your system.

If you look you will find `EXECUTABLE DIRECTORY`, beside it is the file path to a folder with the 'executables' you will be running (files that your terminal will reference when you type a command).

In my case it looked like this: `/opt/homebrew/lib/ruby/gems/3.2.0/bin`

To confirm that the rubocop executable file was located in this directory I did `cd /opt/homebrew/lib/ruby/gems/3.2.0/bin` and then `ls`. Sure enough, rubocop was located there.

So, I opened up `$PATH` and added this directory.
Add the end of the file, simply add `export PATH="/file/path/to/my/executables/directory:$PATH"`
Save. Close file. Quit your terminal. Reopen your terminal.

There's my work around to making that function!
