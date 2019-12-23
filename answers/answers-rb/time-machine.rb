require 'active_support/all'

current = Date.parse '2019-12-14'
def time_machine(date)
  return (date - 2.days) if date.tuesday?
  return nil if date.month == 2 && date.day == 29
  date + 1.year
end

explode_at = loop do
  puts current
  new_date = time_machine(current)
  break current if new_date.nil?
  current = new_date
end
puts "#{explode_at} -- explodes!"

# require 'pry'; binding.pry

# 5148-02-29 -- explodes!
