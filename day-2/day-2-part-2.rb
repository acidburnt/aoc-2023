lines = File.readlines('input.txt', chomp: true)


def get_game_id(line)
	id = line[/Game (.*?):/,1]
	id.to_i
end


def line_power(line)

	def max(line, color_str)
		line.scan(/([0-9]|[1-9][0-9]|[1-9][0-9][0-9])\s#{color_str}/).flatten.map {|a| a.to_i}.max()
	end

	blue_max = max(line, 'blue')
	red_max = max(line, 'red')
	green_max = max(line, 'green')

	blue_max * red_max * green_max

end



the_power = lines.map do |val|
	line_power val
end





puts line_power str
puts the_power.compact.sum