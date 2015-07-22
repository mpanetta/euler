#!/usr/bin/env ruby

=begin
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=end

n = 600851475143
r = Math.sqrt(n).ceil

def prime_factor?(number, factor)
  return false unless number % factor == 0

  return prime?(factor)
end

def prime?(number) # trial division - not great for larger numbers
  return true if number <= 3
  start = Math.sqrt(number).ceil
  start = start - 1 if start % 2 == 0

  while start > 2
    return false if number % start == 0
    start = start - 2
  end

  return true
end

while (r > 0 && !prime_factor?(n, r))
  r = r - 1
end

puts "ANSWER: #{r}"
