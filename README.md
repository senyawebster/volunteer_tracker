# _Anagram, Antigram, & Palindrome Checker_

#### A script that can check to see if two words are anagrams, antigrams, and palindromes _9/8/2017_

#### By _**Senya Webster**_

## Description
The anagrams method is a method of the Word class with takes two arguments (1 at a time in the script). The anagrams method is called on a new instance of a Word object. The method then determines whether the words are the same length or not (a prerequisite to any of the matches), or are in fact words at all (based on whether or not they include any vowels). If these conditions are met then it goes on to inform the user whether the words match with any of the "winning" scenarios. With each if block that returns true, a string in () will be added to the variable word_attrs which is implicitly returned at the end of the function, listing all positive matches with respect to the conditions.

#### Specifications
| Behavior                                                        | Input                     | Output                         |
| --------------------------------------------------------------- |:-------------------------:| ------------------------------:|
| Two words that are anagrams are given                           | cars, scar                | These words are anagrams       |
| Two words that have are anagrams but have different case        | Tea, Eat                  | These words are anagrams       |
| Two words are given, one of which is a palindrome               | madam, scars              | Word1 is a palindrome          |
| Two words that aren't anagrams are given                        | madam, scars              | These words are not anagrams   |
| A word that isn't truly a word is given                         | zzz, bat                  | Word1 is not a word            |
| Two words that are antigrams are given                          | bee, ant                  | These words are antigrams      |


#### To Test Locally
* `git clone https://github.com/senyawebster/Anagrams_Antigrams.git` into your desired directory.
* `cd Anagrams_Antigrams`
* Run 'rspec' and the tests will be run

## Technologies Used

_Ruby_

### License

*This website is licensed under the MIT License*

Copyright (c) 2017 **_Senya Webster_**
