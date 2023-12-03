lines = [
'467..114..',
'...*......',
'..35..633.',
# '......#...',
# '617*.....',
# '.....+.58.',
# '..592.....',
# '......755.',
# '...$.*....',
# '.664.598..'
]

numbers = []

def number_or_nil(string)
  Integer(string || '')
rescue ArgumentError
  nil
end

def create_span(start, number)
  p "#{start} s:n #{number}"
  indexes = []
  for i in start..start+number do
    indexes.push(i)
  end
  p "idx: #{indexes}"
  indexes
end


lines.each_with_index do |line, line_index|

  line.scan(/\*/).each do |star|
    numbers_touching = []
    star_index = line.index(star)


    outside_line = star_index + 1 > line.length or star_index - 1 < 0
    
    
    # prev
    if line_index != 0 and !outside_line then
      previous_line = lines[line_index - 1]

    indexes_above_star = [star_index - 1, star_index, star_index + 1]
    elements_above_star = indexes_above_star.map {|idx| previous_line[idx]}.join("")

    # numbers_abover = previous_line.scan(/(\d+)#{elements_above_star}(\d+)/).flatten
    numbers_above = previous_line.scan(/\d+/).flatten
  
    numbers_above_with_span =  numbers_above.map{|number| [number, create_span(previous_line.index(number), number.length - 1)]}

    index_of_significant_number = elements_above_star.gsub!(/[^\d]/, '')
    p "index_of_significant_number: #{index_of_significant_number}"

    p "elements_above_star: #{elements_above_star}, numbers_above_with_span: #{numbers_above_with_span}, numbers_above: #{numbers_above}"
    end

    #next
    if line_index + 1 < lines.length and !outside_line then
      next_line = lines[line_index + 1]
      inedxes_below_star = [star_index - 1, star_index, star_index + 1]
      elements_below_star = inedxes_below_star.map {|idx| next_line[idx]}.join("")

      p elements_below_star
    end



    p "line: #{line}, star: #{star}, start_index: #{line.index(star)}"

    line.sub!(star, 'X')
  end
end
 

p numbers