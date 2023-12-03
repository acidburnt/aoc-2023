lines = File.readlines('input.txt', chomp: true)

numbers = []

lines.each_with_index do |line, line_index|

  line.scan(/\d+/).each do |number|
    # :hackerman:
    prev_char_idx = line.index(number) - 1 == -1 ? line.index(number) -2 : line.index(number) - 1
    next_char_idx = line.index(number) + number.length
    
    # adjecent horizontally
    if ((line[prev_char_idx] != nil and line[prev_char_idx].scan(/\d|\./).length == 0) or (line[next_char_idx] != nil and line[next_char_idx].scan(/\d|\./).length == 0)) then
      numbers.push(number)
    end


    # adjecent vertically
    for current_number in -1..number.length do
     
      outside_line = line.index(number) + number.length > line.length or line.index(number) - 1 < 0
      indext_to_check = line.index(number) + current_number == -1 ? line.index(number) + current_number - 2 : line.index(number) + current_number

      if line_index + 1 < lines.length and !outside_line then
        char_to_check = lines[line_index + 1][indext_to_check]
        if char_to_check != nil and char_to_check != "." and char_to_check != "X" and (char_to_check =~ /\d/) == nil then
          numbers.push(number)  
        end
      end

      # prev
      if line_index != 0 and !outside_line then
        char_to_check = lines[line_index - 1][indext_to_check]
        if char_to_check != nil and char_to_check != "." and char_to_check != "X" and (char_to_check =~ /\d/) == nil  then
          numbers.push(number)  
        end
      end
    end



    crosses = []
    for i in 1..number.length do
      crosses.push('X')
    end
    line.sub!(number, crosses.join(''))
  end
end

p numbers.map(&:to_i).sum