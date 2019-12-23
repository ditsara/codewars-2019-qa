path_relative_base = '../../questions/'
path =
  File.join(File.dirname(__FILE__), path_relative_base, 'grid/directions.txt')
f = File.readlines path

@x = 0
@y = 0

f.each do |line|
  direction, magnitude = line.split(/\s+/)
  case direction
  when 'NORTH'
    @y += magnitude.to_i
  when 'SOUTH'
    @y -= magnitude.to_i
  when 'EAST'
    @x += magnitude.to_i
  when 'WEST'
    @x -= magnitude.to_i
  else
    puts "something is wrong"
  end
end

puts "End at x: #{@x}, y: #{@y}"

# End at x: 6666, y: -5555
