
input = File.readlines(ARGV[0]).map { |line| line.split.map(&:to_i) }



def valid_rows?(puzzle)
	puzzle.each do |row|
		return false unless row.sort == (1..9).to_a
	end
	return true
end

def valid_columns?(puzzle)
	9.times do |column|
		a = []
		puzzle.each do |row|
			a << row[column]
		end
		return false unless a.sort == (1..9).to_a
	end
	return true
end

def valid_boxes?(puzzle)
	a = []
	3.times do |columns|
	  puzzle.each do |row|
		  a << row.each_slice(3).to_a[columns]
	  end
	end
	a.each_slice(3).each do |box|
		return false unless box.join.split(//).map(&:to_i).sort == (1..9).to_a
	end
	return true
end

def valid_puzzle?(puzzle)
	return valid_rows?(puzzle) && 
		 valid_columns?(puzzle) && 
		 valid_boxes?(puzzle)
end

puts valid_puzzle?(input)