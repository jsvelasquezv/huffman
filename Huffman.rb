load "Archives.rb"
load "BST.rb"

class Huffman

	attr_accessor :inputString, :archives, :frecuency, :huffmanTree, :nodes,
					:alphabet

	def initialize
		@archives = Archives.new
		@inputString = @archives.readText("input.txt")
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
		@frecuency = @frecuency.sort_by{|_key,value|value}.to_h
	end

	def createNodes
		@nodes = []
		@frecuency.each do | char, frecuency |
			@nodes.push(Node.new(char, frecuency, nil, nil))
		end
	end

	def createTree
		i = 0
		j = 1
		for k in (1..@frecuency.size-1) do
			char = @nodes[i].char + @nodes[j].char
			frecuency = @nodes[i].frecuency + @nodes[j].frecuency
			node = Node.new(char, frecuency, @nodes[i], @nodes[j]) 
			nodes.shift(2)
			@nodes.push(node)
			i+2
			j+2
		end
	end

	def generateHuffmanAlphabet
		tree = @nodes[0]
		@alphabet = {}
		# tree.search(tree, "o")
		@frecuency.each do | key, value |
			@alphabet.store(key, tree.search(tree,key))
		end
		puts @alphabet
	end

	def imprimir
		puts @frecuency
	end

	def printNodes
		@nodes.each do | node |
			puts node
		end
	end
end

h = Huffman.new()
h.frecuencyCount
h.createNodes
h.imprimir
h.createTree
#h.printNodes
h.generateHuffmanAlphabet
