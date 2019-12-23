require 'json'
require 'active_support/all'

path_relative_base = '../../questions/'
path =
  File.join File.dirname(__FILE__), path_relative_base, 'tree-search/tree.rb'

j = JSON.parse `ruby #{path} gen dan`

def process(node, sentence = "", score = 0)
  new_sentence = (sentence + ' ' + node["name"]).gsub(/\s+/, ' ').strip
  new_score = score + node["score"]
  if node["children"].empty?
    [{ sentence: new_sentence, score: new_score }]
  else
    node["children"].map { |child| process(child, new_sentence, new_score)}.flatten
  end
end

results = process j
max_score = results.max_by { |r| r[:score] }[:score]
puts results.select { |r| r[:score] >= max_score }
