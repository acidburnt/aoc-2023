lines = File.readlines('input.txt', chomp: true)

times = lines[0].scan(/\d*/).select{|val| val != "" }
distances = lines[1].scan(/\d*/).select{|val| val != "" }


def get_better_distances (time, max_distance)

  speed = 0
  better_distances = []

  time_left = time

  for i in 0..time do

    new_distance = time_left * speed

  if new_distance > max_distance then
    better_distances.push(new_distance)
  end 


    time_left -= 1
    speed += 1
  end

  return better_distances.length

end 


solution_counts = []

times.each_with_index do |val, index|

  solutions = get_better_distances(val.to_i, distances[index].to_i)

  if solutions > 0 then
    solution_counts.push(solutions)
  end



end

p solution_counts.inject(:*)