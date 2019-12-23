require 'ostruct'

path_relative_base = '../../questions/'
path =
  File.join(File.dirname(__FILE__), path_relative_base, 't9-autocomplete/contacts.txt')
f = File.readlines path

@contacts = f.map do |line|
  OpenStruct.new name: line[0..22].strip.downcase,
    phone: line[23..-1].strip.gsub(/[^0-9]/, '')
end.freeze

@t9 = [[2, "ABC"],
      [3, "DEF"],
      [4, "GHI"],
      [5, "JKL"],
      [6, "MNO"],
      [7, "PQRS"],
      [8, "TUV"],
      [9, "WXYZ"]].to_h.transform_values { |v| v.downcase.split('') }.freeze

def match(input)
  input = input.to_s.gsub /[10]/,''
  regexes = input.split('').map do |ch|
    "[#{@t9[ch.to_i]}]"
  end
  @contacts.select { |contact| contact.name =~ /^#{regexes.join}/ }
end

[ 728, 5203, 273, 2738 ].each do |number|
  puts "-- number: #{number}"
  matches = match(number)
  puts matches.empty? ? '(none)' : matches
end

# -- number: 728
# #<OpenStruct name="patricia adkins", phone="7412562766">
# #<OpenStruct name="savannah parrish", phone="5663583637">
# #<OpenStruct name="saul hines", phone="3743012845">
# #<OpenStruct name="saul harrell", phone="4709514931">
# -- number: 5203
# #<OpenStruct name="kadyn giles", phone="5979810606">
# -- number: 273
# #<OpenStruct name="brennan rosales", phone="9302386553">
# #<OpenStruct name="brennen miranda", phone="8449765922">
# -- number: 2738
# (none)
