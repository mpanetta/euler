#! /usr/bin/env ruby

=begin
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
How many circular primes are there below one million?
=end

require "benchmark"

class Prime
  def self.is_circular_prime?(number)
    rotations(number).all? { |n| is_prime?(n) }
  end

  def self.is_prime?(number)
    return false if number == 0
    return true if number < 3

    top = Math.sqrt(number).floor

    !((2..top).any? { |f| is_factor?(number, f) })
  end

  def self.sieve(max)
    sieve = []
    (2..max).each { |i| sieve[i] = i }

    (2..Math.sqrt(max).to_i).each do |i|
      next unless sieve[i]

      (i ** 2).step(max, i) do |j|
        sieve[j] = nil
      end
    end

    sieve.compact
  end

  # private

  def self.is_factor?(number, factor)
    number % factor == 0
  end
  private_class_method :is_factor?

  def self.rotations(number)
    digits = number.to_s.split(//)
    (0..digits.length - 1).collect do |index|
      first_part = digits.slice(0, index)
      last_part = digits.slice(index, digits.length - index)

      (last_part + first_part).join.to_i
    end
  end
  private_class_method :rotations
end

circulars = []
time = Benchmark.measure do
  list = Prime.sieve(1000000)

  list.each do |number|
    circulars << number if Prime.is_circular_prime?(number)
  end
end

puts "COUNT: #{circulars.count}, TIME: #{time.inspect}"

