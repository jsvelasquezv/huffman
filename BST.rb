class Node

	#Getters and setters
	attr_accessor :key, :left, :right, :parent

	#Constructor
	def initialize key, left, right, parent
		@key = key
		@left = left
		@right = right
		@parent = parent
	end	
end

class BinarySearchTree 

	def initialize (key)
		@root = Node.new(key,nil,nil,nil)
	end

	def insert key
		currentNode = @root
		while currentNode != nil
			if (key < currentNode.key) && (currentNode.left == nil) #1
				currentNode.left = Node.new(key,nil,nil, currentNode)
			elsif (key > currentNode.key) && (currentNode.right == nil) #2
				currentNode.right = Node.new(key,nil,nil, currentNode) 
			elsif (key < currentNode.key) #3
				currentNode = currentNode.left
			elsif (key > currentNode.key) #4
				currentNode = currentNode.right
			else
				return				
			end
		end
	end


	def inOrder(node = @root)
        return if (node == nil)
        inOrder(node.left)
        puts node.key.to_s
        inOrder(node.right)
	end

=begin
	1) Si el nodo no tiene hijo izquierdo y el valor es menor que la llave 
	de este, se insertara el nuevo hijo a la izquierda.

	2) Si el nodo no tiene hijo derecho y el valor es mayor que la llave 
	de este, se insertara el nuevo hijo a la derecha.

	3) Si el nodo tiene hijo izquierdo y derecho, y ademas el valor a insertar
	es menor que la llave de este, el nodo actual pasara a ser el hijo izquierdo

	4) Si el nodo tiene hijo izquierdo y derecho, y ademas el valor a insertar
	es mayor que la llave de este, el nodo actual pasara a ser el hijo derecho
=end	

end

bst = BinarySearchTree.new(5)
bst.insert(2)
bst.insert(6)
bst.insert(3)
bst.inOrder()
