A foreach loop runs a block of code for each element of a list. No big whoop, “perl foreach” continues to be one of the most popular on Google searches for the language. So we thought we’d see what’s happened in 20 years. I expand on Tom Christiansen’s slide that’s part of his longer presentation then add a new but experimental feature at the end. If you want more, there’s plenty to read in perlsyn or my book Learning Perl.
Going through a list

Unless you say otherwise, foreach aliases the current element to the topic variable $_. You can specify that list directly in the parentheses after foreach, use an array variable, or use the result of a subroutine call (amongst other ways to get a list):
