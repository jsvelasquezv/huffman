load "Archives.rb"
load "BST.rb"

class Huffman

	attr_accessor :inputString, :archives, :frecuency, :huffmanTree, :nodes,
					:alphabet, :asciiAlphabet, :nodeCount, :maxHeight

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
		@nodeCount = @nodes.size + (@nodes.size - 1)
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
		#a = tree.search(tree, "l")
		#puts a.join("")
		@frecuency.each do | key, value |
			@alphabet.store(key, tree.search(tree,key).join(""))
		end
		@maxHeight = tree.maxHeight(tree)
	end

	def generateBinaryEncoding
		@inputString = @archives.readText("input.txt")
		binaryEncoding = @inputString
		@inputString.each_char do | char |
			binaryEncoding[char]=@alphabet[char]
		end
		@archives.writeText("binaryEncoding.txt",binaryEncoding)
	end

	def writeCodificationTable
		table = "Cantidad de nodos: " + @nodeCount.to_s + "\n" + "Altura maxima: " + @maxHeight.to_s + "\n" + @alphabet.to_s.gsub(",","\n")

		@archives.writeText("codificationTable.txt", table)
	end

	def generateAsciiAlphabet
		@asciiAlphabet = {}
		@alphabet.each do | key, value |
			ascii = value.to_i(2).chr
			@asciiAlphabet.store(key, ascii.to_s)
		end
	end

	def generateAsciiEncoding
		@inputString = @archives.readText("input.txt")
		asciiEncoding = @inputString
		@inputString.each_char do | char |
			asciiEncoding[char]=@asciiAlphabet[char]
		end
		@archives.writeText("asciiEncoding.txt",asciiEncoding)
	end
end

h = Huffman.new()
h.frecuencyCount
h.createNodes
h.createTree
h.generateHuffmanAlphabet
h.writeCodificationTable
h.generateBinaryEncoding
h.generateAsciiAlphabet
h.generateAsciiEncoding
