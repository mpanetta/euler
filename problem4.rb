#!/usr/bin/env ruby

=begin
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
=end

largest = -1

def palindromic?(number)
  x = number.to_s.split(//)
  return false if x.count % 2 != 0

  left = x.slice(0, x.count / 2).join
  right = x.slice(x.count / 2, x.count).reverse.join

  return left == right
end

(0..99).each do |a|
  (0..99).each do |b|
    product = (999 - a) * (999 - b)
    largest = product if product > largest && palindromic?(product)
  end
end

puts "ANSWER: #{largest}"