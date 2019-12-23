require 'active_support/all'
require 'securerandom'
require 'json'

class TreeGen
  def self.call(prng_seed_string)
    new(prng_seed_string).generate
  end

  class Node
    attr_accessor :name, :children, :score
    def initialize(attrs = {})
      i = attrs
      @name = i[:name]
      @children = i[:children] || []
      @score = i[:score] || 0
    end

    def as_json
      { name: name, score: score, children: children.map(&:as_json) }
    end
  end

  attr_accessor :prng

  def initialize(prng_seed_string)
    seed = 0
    prng_seed_string.bytes.each_with_index do |n, idx|
      seed = seed ^ (n << (idx * 2))
    end
    @prng = Random.new(seed)
  end

  def generate
    adj_1 = [*adjs_positive, *adjs_positive]
    adj_2 = [*adjs_appearance, *adjs_condition, *adjs_shape, *adjs_positive, *adjs_negative]

    root = Node.new name: "codewars is a "

    adjs_1 = 3.times.map do
      set = adj_1
      x = set[prng.rand(set.count - 1)]
      n = Node.new(name: x, score: prng.rand(5))
      root.children << n
      n
    end

    nouns_event = adjs_1.flat_map do |node|
      3.times.map do
        set = noun_event
        x = set[prng.rand(set.count - 1)]
        n = Node.new(name: "#{x} for", score: prng.rand(5))
        node.children << n
        n
      end
    end

    adjs_2 = nouns_event.flat_map do |node|
      3.times.map do
        set = adj_2
        x = set[prng.rand(set.count - 1)]
        n = Node.new(name: x, score: prng.rand(5))
        node.children << n
        n
      end
    end

    adjs_2.flat_map do |node|
      3.times.map do
        set = noun_person
        x = set[prng.rand(set.count - 1)]
        n = Node.new(name: x, score: prng.rand(5))
        node.children << n
        n
      end
    end

    root.as_json
  end

  def noun_person
    %w(
architects builders designers directors inventors managers planners surveyors
contrivers devisers manipulators originators schemers sights techies
astrologers clairvoyants conjurers diviners enchanters fortunetellers
hypnotists magicians maguses mediums necromancers occultists palmists seers
shamans soothsayers sorcerers thaumaturges warlocks witchs augurers
    )
  end

  def noun_event
    %w(
accident act action affair appearance business case celebration ceremony
circumstance crisis development episode experience fact holiday incident matter
occasion situation story thing advent adventure calamity catastrophe chance
coincidence conjuncture deed emergency exploit function juncture marvel
milestone miracle misfortune mishap mistake occurrence pass phase phenomenon
predicament proceeding shift tide transaction triumph turn wonder
    )
  end

  def adjs_appearance
    %w(
attractive bald beautiful chubby clean dazzling drab elegant fancy fit flabby
glamorous gorgeous handsome long magnificent muscular plain plump quaint
scruffy shapely short skinny stocky ugly unkempt unsightly
    )
  end

  def adjs_condition
    %w(
alive better careful clever dead easy famous gifted hallowed helpful important
inexpensive mealy mushy odd poor powerful rich shy tender unimportant
uninterested vast wrong
    )
  end

  def adjs_positive
    %w(
aggressive agreeable ambitious brave calm delightful eager faithful gentle
happy jolly kind lively nice obedient polite proud silly thankful victorious
witty wonderful zealous
    )
  end

  def adjs_negative
    %w(
angry bewildered clumsy defeated embarrassed fierce grumpy helpless itchy
jealous lazy mysterious nervous obnoxious panicky pitiful repulsive scary
thoughtless uptight worried
    )
  end

  def adjs_shape
    %w(
broad chubby crooked curved deep flat high hollow low narrow refined round
shallow skinny square steep straight wide
    )
  end
end

class TreeAns
  def self.call(json)
    new(json).generate
  end

  def initialize(json)
    @json = json.deep_stringify_keys
  end

  def generate
    results = process @json
    max_score = results.max_by { |r| r[:score] }[:score]
    results.select { |r| r[:score] >= max_score }
  end

  def process(node, sentence = "", score = 0)
    new_sentence = (sentence + ' ' + node["name"]).gsub(/\s+/, ' ').strip
    new_score = score + node["score"]
    if node["children"].empty?
      [{ sentence: new_sentence, score: new_score }]
    else
      node["children"].map { |child| process(child, new_sentence, new_score)}.flatten
    end
  end
end

case (cmd = ARGV[0])
when "gen"
  puts JSON.pretty_generate(TreeGen.(ARGV[1]).as_json)
when "ans"
  json = TreeGen.(ARGV[1])
  puts TreeAns.(json).map { |ans| ans[:sentence] }
else
  puts "Usage:"
  puts "  generate tree   -- ruby tree.rb gen <username>"
  puts "  check answer(s) -- ruby tree.rb ans <username>"
end
