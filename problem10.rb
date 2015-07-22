#!/usr/bin/env ruby

=begin

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.

=end

class Prime
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
end

primes = Prime.sieve(2000000)
puts "TOTAL: #{primes.inject(:+)}"
