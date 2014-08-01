#!/usr/bin/env ruby

=begin
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st prime number?
=end

def prime?(number, primes)
  root = Math.sqrt(number).ceil
  index = primes.index(primes.find { |i| i >= root })

  factors = primes.slice(1, index ? index + 1 : primes.count)
  return factors.none? { |i| number % i == 0 }
end

primes = [2]
n = 3

while primes.count < 10001
  primes << n if prime?(n, primes)

  n = n + 2
end

puts "ANSWER: #{primes.last}"