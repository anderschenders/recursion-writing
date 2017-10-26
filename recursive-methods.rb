# Authoring recursive algorithms. Add comments including time and space complexity for each method.

# Write #1
# factorial(n) Write a method factorial that accepts an integer parameter n and that uses recursion to compute and return the value of n factorial (also known as n!)
# e.g. fact(4) = 4 * 3 * 2 * 1 = 24

def factorial(n)
  if n == 0
    return 1
  else
    return n * factorial(n - 1)
  end
end

if factorial(4) == 24
  puts "Factorial alg: Right!"
else
  puts "Factorial alg: BUG"
end

#time comp: O(n) where n is the size of the digit. As the integer increases, the computational time increases at the same rate.
#space comp: O(n) where n is the size of the number. Ad the number increases, the number of times the function is called grows at the same rate.

# Write #2
# reverse(s) Write a method reverse that accepts a string as a parameter and then returns the reverse of the string by reversing all letters and all words in the string.
# e.g. reverse("hello world") will return "dlrow olleh"

def reverse(s)
  n = s.length - 1
  if n == 0
    return s
  else
    return s[-1] + reverse(s[0..(n-1)])
  end
  # if s[0] == s[-1]
  #   return s
  # else
  #   return s[-1] + reverse_inplace(s[1..-2])+ s[0]
  # end
end

s = "hello world"
if reverse(s) == "dlrow olleh"
  puts "Reverse str alg: Right! #{s}"
else
  puts "Reverse str alg: BUG"
end

#time comp: O(n)
#space comp: O(n) * O(n) = On^2 (it takes up O(n) space of memory and O(n) space to create a string each time)

# Write #3
# reverse_inplace(s) Write a method reverse_inplace that accepts a string as a parameter and then reverses the string in place using a recursive algorithm.
# e.g. reverse("hello world") will convert the input string to "dlrow olleh"

def reverse_inplace(s, i=0, j=(-1))

  base_case = s.length / 2
  if s[i] == s[j] || (i == base_case)
    return s
  else
    temp = s[i]
    s[i] = s[j]
    s[j] = temp

    reverse_inplace(s, i+1, j-1)
  end
end

s = "hello world"
if reverse_inplace(s) == "dlrow olleh"
  puts "Reverse str inplace alg: Right! - #{s}"
else
  puts "Reverse str inplace alg: BUG - #{s}"
end

#time comp: where n is the length of the string, the computational time grows at half that rate (n/2), so O(n).
#space comp: O(n)

# Write #4
# bunny(n) Write a method bunny that accepts an integer parameter n. N represents a number of bunnies and each bunny has two big floppy ears. We want to compute the total number of ears across all the bunnies recursively (without loops or multiplication).
# e.g. bunny(0) = 0  => n * 2 => (0 * 2)
# e.g. bunny(1) = 2   => n * 2 => (1 * 2)
# e.g. bunny(10) = 20  => n * 2  => (1 * 2) + (1 * 2) + (1 * 2)...

def bunny(n)
  if n == 0
    return n
  else
    return 2 + bunny(n-1)
  end
end

n = 4
if bunny(4) == 8
  puts "Bunny alg: Right!"
else
  puts "Bunny str alg: BUG - #{bunny(n)}"
end

#time comp: O(n), where n is the number of bunnies; computational time grows at same rate.
#space comp: O(n), n is number of bunnies; required space in memory grows at same rate as number of bunnnies.

# Write #5
# nested(s) Write a method nested that accepts a string of only parenthesis and then returns if those parenthesis are properly nested. You may assume that no non-paren characters will be passed to this method.
# e.g. nested("((()))") = true
# e.g. nested("())") = false Challenge: Try doing this without creating new strings in the process of solving the problem.

def nested(s, i=0, j=(-1))
  base_case = s.length / 2
  #ensure even length of characters
  if s.length % 2 != 0
    return false
  else
    if s.length == 0 || i == base_case
      return true
    else
      if (s[i] == "(") && (s[j] == ")")
        return nested(s, i+1, j-1)
      else
        return false
      end
    end
  end
end

#time comp: where n is the number of characters in the string, it takes O(n/2) time to compute, so O(n)
#space comp: where n is the number of characters in the string, it takes O(n/2) stack calls, so O(n)

s = "((()))"
if nested(s) == true
  puts "Nested alg: Right!"
else
  puts "Nested alg: BUG - #{nested(s)}"
end

s = "((())"
if nested(s) == false
  puts "Nested alg 2: Right!"
else
  puts "Nested alg alg 2: BUG - #{nested(s)}"
end


# Write #6
# search(array, value) Write a method search that accepts an unsorted array of integers and an integer value to find and then returns true if the value if found in the unsorted array and false otherwise. Make the algorithm recursive.
# e.g. search([34, 45, 21, 4, 67], 4) should return true
# e.g. search([24, 51, 11], 4) should return false
# e.g. search([], 4) should return false

def search(array, value, i=0)
  indices = array.length - 1

  if i > indices
    return false

  else
    if array[i] == value
      return true
    else
      return search(array, value, i += 1)
    end
  end
end


#time comp: O(n) where n is the number of elements in the unsorted array; you need to check each one in the worst case.
#space comp: O(n) where n is the number of elements in the array, as you are calling the function that many times.


# Write #7
# is_palindrome(s) Write a recursive method pal that accepts a string s as a parameter and returns a boolean value indicating if that string is a palindrome or not.
# e.g. is_palindrome("racecar") = true
# e.g. is_palindrome("smile") = false Challenge: Try doing this without creating new strings in the process of solving the problem.

def is_palindrome(s, i=0, j=-1)
  base_case = s.length / 2
  if s[i] == s[j] || (i == base_case)
    return true
  else
    if s[i] == s[j]
      return is_palindrome(s, i+=1, j-=1)
    else
      return false
    end
  end
end

#time comp: Where n is the number of characters. It takes On/2 time to check the string, so O(n) time.
#space comp: Where n is the number of characters, it takes n/2 calls to the stack, so O(n).

s = "asdffdsa"
if is_palindrome(s) == true
  puts "Palindrome alg: Right!"
else
  puts "Palindrome alg: BUG"
end

# Write #8
# digit_match(n, m) Design and implement a recursive method that accepts two non-negative integers as parameters and that returns the number of digits that match in the two integers. Two digits match if they are equal and have the same position relative to the end of the number (i.e. starting with the ones digit). In other words, the method should compare the last digits of each number, the second-to-last digits of each number, the third-to-last digits of each number, and so forth, counting how many pairs match. For example, for input values of (1072503891, 62530841), the method would compare as follows:
#
# 1 0 7 2 5 0 3 8 9 1
#     | | | | | | | |
#     6 2 5 3 0 8 4 1
# The method should return 4 in this case because 4 of these pairs match (2-2, 5-5, 8-8, and 1-1).

def digit_match(n, m , c=0)

  if n == 0 || m == 0
    return c
  else
    if n % 10 == m % 10
      c+= 1
    end
  end
  return digit_match(n / 10, m / 10, c)
end

#time comp: Where n is the number of digits, it takes O(n) time to compare all the digits.
#space comp: Where n is the number of digits, it takes O(n) calls to the function.

#Added functionfib(n)

# Write a recursive method fib that accepts an integer index n as a parameter and returns the nth fibonacci number.
# e.g. fib(4) = (0 1 1 2 3) should return 3

def fib(index)
  if index == 0
    return 0
  elsif index == 1
    return 1
  else
    return fib(index - 1) + fib(index - 2)
  end
end

#time comp: Where n is the size of the index, for each digit, you are making two calls to the function. So O(n)?
#space comp: For each index, there are two call stacks. As the index gets bigger, the number of calls to the stack grows at the same rate.

index = 4
if fib(index) == 3
  puts "Fib algorithm: Right!"
else
  puts "Fib algorithm: Bug!"
end

index = 8
if fib(index) == 21
  puts "Fib algorithm: Right!"
else
  puts "Fib algorithm: Bug!"
end



# Factorial Tests
raise "factorial broke - factorial(4)" unless factorial(4) == 24
raise "factorial broke - factorial(0)" unless factorial(0) == 1
puts "passes all factorial tests"

# Reverse Tests
raise "reverse broke - reverse('hello world')" unless reverse("hello world") == "dlrow olleh"
raise "reverse broke - reverse('a b c')" unless reverse("a b c") == "c b a"
puts "passes all reverse tests"

# Reverse In place Tests
str_1 = 'hello world'
reverse_inplace(str_1)
raise "reverse broke - reverse_inplace('hello world')" unless str_1 == "dlrow olleh"
str_2 = 'a b c'
reverse_inplace(str_2)
raise "reverse broke - reverse_inplace('a b c')" unless str_2 == "c b a"
puts "passes all reverse_inplace tests"

# Bunny Tests
raise "bunny broke - bunny(0)" unless bunny(0) == 0
raise "bunny broke - bunny(10)" unless bunny(10) == 20
puts "passes all bunny tests"

# Nested Tests
raise "nested broke - nested('((()))')" unless nested("((()))") == true
raise "nested broke - nested('())')" unless nested("())") == false
puts "passes all nested tests"

# Search Tests
arr_1 = [34, 45, 21, 4, 67]
raise "search broke - search([34, 45, 21, 4, 67], 4)" unless search(arr_1, 4) == true
arr_2 = [24, 51, 11]
raise "search broke - search([24, 51, 11], 4)" unless search(arr_2, 4) == false
arr_3 = []
raise "search broke - search([], 4)" unless search(arr_3, 4) == false
puts "passes all search tests"

# Palindrome Tests
raise "is_palindrome broke - is_palindrome('racecar')" unless is_palindrome('racecar') == true
raise "is_palindrome broke - is_palindrome('smile')" unless is_palindrome('smile') == false
puts "passes all palindrome tests"

# Digit Match Tests
raise "digit_match broke - digit_match(1072503891, 62530841)" unless digit_match(1072503891, 62530841) == 4
raise "digit_match broke - digit_match(1234, 4321)" unless digit_match(1234, 4321) == 0
raise "digit_match broke - digit_match(3862947593, 3862947593)" unless digit_match(3862947593, 3862947593) == 10
puts "passes all digit_match tests"
puts "All test passed"
