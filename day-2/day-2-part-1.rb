lines = File.readlines('input.txt', chomp: true)


$initial = {
	red: 12,
	green: 13,
	blue: 14,
}

def get_game_id(line)
	id = line[/Game (.*?):/,1]
	id.to_i
end


# this is bad, but it works
def is_game_possible(line)
	is_possible = true;

	marbles_string = line[/: (.*?)$/,1].split(', ')
	.map {|x| x.split('; ')}
	.flatten
	.map {|x| x.split(' ')}
	.each do |value, color|
		initial_value = $initial[color.to_sym]
		if value.to_i > initial_value then
			is_possible = false;
		end
	end

	is_possible
end


possible_ids = lines.map do |val|
	if is_game_possible(val) then
		get_game_id(val)
	end
end

puts possible_ids.compact.sum


# stolen from part 2
def is_game_possible_2(line)

	def max(line, color_str)
		line.scan(/([0-9]|[1-9][0-9]|[1-9][0-9][0-9])\s#{color_str}/).flatten.map {|a| a.to_i}.max()
	end

	blue_max = max(line, 'blue')
	red_max = max(line, 'red')
	green_max = max(line, 'green')

	if red_max > $initial[:red] or green_max > $initial[:green] or blue_max > $initial[:blue] then
		return false
	end


	return true

end


possible_ids_2 = lines.map do |val|
	if is_game_possible_2(val) then
		get_game_id(val)
	end
end

puts possible_ids_2.compact.sum
