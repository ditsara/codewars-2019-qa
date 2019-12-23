path_relative_base = '../../questions/'
path =
  File.join(File.dirname(__FILE__), path_relative_base, 'artist/')
filename =
  File.join(path, 'picture.txt')
f = File.readlines filename

cmds = 'r'

f.each do |line|
  line.split('').each do |ch|
    if ch == 'x'
      cmds << 'du'
    end
    cmds << 'm'
  end
  cmds << 'a'
  cmds << line.length.times.map { 'm' }.join
  cmds << 'lml'
end

puts `#{path}/bin/artist-linux-amd64 #{cmds}`
