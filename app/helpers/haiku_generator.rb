module HaikuGenerator
  class Haiku
    attr_reader :first_line, :second_line, :third_line
    def initialize(first_line, second_line, third_line)
      @first_line = first_line
      @second_line = second_line
      @third_line = third_line
    end

    def to_s
      [first_line, second_line, third_line].join("\n")
    end
  end

  class HaikuGenerator
    attr_reader :phrase_generator

    def initialize
      @phrase_generator = PhraseGenerator.new
    end

    def generate
      Haiku.new(phrase_generator.generate(5),
                phrase_generator.generate(7),
                phrase_generator.generate(5))
    end

  end

  class PhraseGenerator 
    attr_reader :word_chooser

    def initialize
      @word_chooser = WordChooser.new
    end

    def generate(syllables)
      phrase = []
      until syllables.zero?
        syllable = random_syllable(syllables)
        # TODO: getting around a bug
        next if syllable > 3
        phrase << word_chooser.choose(syllable)
        syllables -= syllable
      end
      return phrase.join(' ')
    end

    def random_syllable(upper_bound)
      # TODO: this doesn't always work, so I hack it
      return (rand(upper_bound + 1) % upper_bound) + 1
    end

  end

  class WordChooser
    def choose(syllable_count)
      possible_words = Word.
      return possible_words.sample
    end
  end

  # Not going to use this
  class WordBank
    class << self; attr_reader :word_bank end

    def self.word_bank
      require 'yaml'
      @word_bank ||=  YAML.load_file('word_base.yaml')
    end

    def self.get_words_with(syllable_count)
      return word_bank[syllable_count]
    end
  end
end
