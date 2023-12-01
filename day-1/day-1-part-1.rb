file = File.open('input.txt')

answer = 0;

file.readlines.map(&:chomp).each do |line|
	numbers = line.scan(/\d/)
	numbers_size = numbers.length
	
	number_to_add = "#{numbers[0]}#{numbers[numbers_size - 1]}".to_i
	answer = answer + number_to_add
end
puts answer

