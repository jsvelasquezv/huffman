class Archives 

	attr_accessor :inputString

	def initialize()
		@inputString = ''
	end

	def readText file
		File.open(file, 'r') do | line |
			while string = line.gets
				@inputString << string
			end
		end
		return @inputString.downcase
	end

	def writeText file, text
		File.open(file, 'w') do | string |
			string.puts(text)
		end
	end
end