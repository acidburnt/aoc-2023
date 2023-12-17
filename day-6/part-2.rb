lines = File.readlines('input.txt', chomp: true)

time = lines[0].scan(/\d*/).select{|val| val != "" }.join('')
distance = lines[1].scan(/\d*/).select{|val| val != "" }.join('')


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




p get_better_distances(time.to_i, distance.to_i)