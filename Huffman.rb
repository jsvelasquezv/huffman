load "Archives.rb"

class Huffman

	attr_accessor :inputString, :archives, :frecuency

	def initialize
		@archives = Archives.new
		@inputString = @archives.readText("input.txt")
	end

	def print
		puts @inputString
	end

	def frecuencyCount
		@frecuency = {}
		@inputString.each_char do | character |
			if @frecuency.has_key?(character)
				@frecuency[character] += 1
			else 
				@frecuency.store(character,1)
			end
		end
		@frecuency.values.sort
	end
end

h = Huffman.new()
h.frecuencyCount
