file = File.open('input.txt')


numbers_hash = {
  one: 1,
  two: 2,
  three: 3,
  four: 4,
  five: 5,
  six: 6,
  seven: 7,
  eight: 8,
  nine: 9,
}

answer = 0

file.readlines.map(&:chomp).each do |line|
  numbers = line.scan(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/).flatten
	numbers_size = numbers.length
  
  first_entry = numbers[0]
  last_entry = numbers[numbers_size - 1]



  first_number = numbers_hash[first_entry.to_sym] ? numbers_hash[first_entry.to_sym] : first_entry[0]
  last_number =  numbers_hash[last_entry.to_sym] ? numbers_hash[last_entry.to_sym] : last_entry[0]

  
	number_to_add = "#{first_number}#{last_number}".to_i
	answer = answer + number_to_add
end
puts answer

