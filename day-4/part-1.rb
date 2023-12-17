lines = File.readlines('input.txt', chomp: true)


score = 0

lines.each do |line|
   winning_numbers = line[/:\s(.*?)\s\|/,1].split(' ')
   my_numbers = line[/\|\s(.*?)$/,1].split(' ')

   match_count = 0
   my_numbers.each_with_index do |num, idx|
      if winning_numbers.include?(num) then 
        match_count += 1
      end
   end

  card_score = 0
  for counter in 1..match_count
   
    card_score = card_score * 2

    if card_score == 0 then
      card_score = 1
    end
  end

  score += card_score

end
p "score: #{score}"