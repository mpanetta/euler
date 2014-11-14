#!/usr/bin/env ruby

=begin
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=end

SUM = 1000
START = 501

i = START
a = b = c = 0

begin
  i -= 1

  c = i
  (1..(c - 1)).reverse_each do |i|
    (1..(i - 1)).reverse_each do |j|
      a = j
      b = i

      if (a + b + c) == SUM && (a**2 + b**2 == c**2)
        puts "#{a}, #{b}, #{c}  - #{a * b * c}"
      end
    end
  end
end while (i > 3)

