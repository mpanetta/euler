#!/usr/bin/env ruby

=begin
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=end

def divisible?(number)
  return (2..20).all? { |i| number % i == 0 }
end

n = 20

while !divisible?(n)
  n = n + 10
end

puts "ANSWER: #{n}"