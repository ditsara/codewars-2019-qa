path_relative_base = '../../questions/'
filename = File.join(File.dirname(__FILE__), path_relative_base, 'stock-market/sp500.txt')
f = File.readlines(filename)
data = f.map { |line| [line[0..13].strip, line[14..-1].strip.to_f] }

@best =  { from: "x", to: "x", s_price: nil, e_price: nil, rtn: nil }
@worst = { from: "x", to: "x", s_price: nil, e_price: nil, rtn: nil }

def calc(start_date, end_date, start_price, end_price)
  return if start_price.zero?
  rtn = (end_price / start_price) - 1
  if @best[:rtn].nil? || rtn > @best[:rtn]
    @best = {
      from: start_date,
      to: end_date,
      s_price: start_price,
      e_price: end_price,
      rtn: rtn
    }
  end
  if @worst[:rtn].nil? || rtn < @worst[:rtn]
    @worst = {
      from: start_date,
      to: end_date,
      s_price: start_price,
      e_price: end_price,
      rtn: rtn
    }
  end
end

data.each_with_index do |(start_date, start_price), s|
  end_date, end_price = data[s+60]
  next unless end_date && end_price
  calc(start_date, end_date, start_price, end_price)
end

puts "best  -- #{@best}"
puts "worst -- #{@worst}"

# best  -- {:from=>"1932-06-09", :to=>"1932-09-02", :s_price=>4.57, :e_price=>8.84, :rtn=>0.9343544857768051}
# worst -- {:from=>"1932-03-07", :to=>"1932-06-01", :s_price=>8.82, :e_price=>4.4, :rtn=>-0.5011337868480725}
