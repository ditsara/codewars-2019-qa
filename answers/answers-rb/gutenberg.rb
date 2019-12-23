path_relative_base = '../../questions/'
filename =
  File.join(File.dirname(__FILE__), path_relative_base, 'gutenberg/beowulf.txt')
f = File.read filename

print_set = [["a", 35],
             ["b", 8],
             ["c", 8],
             ["d", 20],
             ["e", 70],
             ["f", 20],
             ["g", 10],
             ["h", 40],
             ["i", 35],
             ["k", 5],
             ["l", 20],
             ["m", 8],
             ["n", 30],
             ["o", 40],
             ["p", 10],
             ["q", 2],
             ["r", 35],
             ["s", 35],
             ["t", 40],
             ["u", 15],
             ["v", 5],
             ["w", 18],
             ["y", 8],
             ["z", 2]].to_h.freeze

current_page = 1
current_print_set = print_set.dup

f.split('').each do |chr|
  k = chr.downcase
  next unless current_print_set.key? k
  if current_print_set[k] <= 0
    current_page += 1
    current_print_set = print_set.dup
    current_print_set[k] -= 1
  else
    current_print_set[k] -= 1
  end
end

puts current_page
# 401
