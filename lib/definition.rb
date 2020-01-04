class Definition
    attr_reader :id
    attr_accessor :definitions, :word_id

    @@definitions = {}
    @@total_rows = 0

    def initialize(definitions, word_id, id)
      @definitions = definitions
      @word_id = word_id
      @id = id || @@total_rows += 1
    end

    def ==(definitions_to_compare)
      (self.definitions() == definitions_to_compare.definitions()) && (self.word_id() == definitions_to_compare.word_id())
    end

    def self.all
      @@definitions.values
    end

    def self.clear
      @@definitions = {}
      @@total_rows = 0
    end

    def save
      @@definitions[self.id] = Definition.new(self.definitions, self.word_id, self.id)
    end

    def self.find(id)
      @@definitions[id]
    end

    def update(definitions, word_id)
      self.definitions = definitions
      self.word_id = word_id
      @@definitions[self.id] = Definition.new(self.definitions, self.word_id, self.id)
    end

    def delete
      @@definitions.delete(self.id)
    end

    def self.clear
      @@definitions = {}
    end

    def self.find_by_word(word_id)
    words = []
    @@definitions.values.each do |definitions|
      if definitions.word_id == word_id
        words.push(definitions)
      end
    end
    words
  end

    def word
        Dictionairy.find(self.word_id)
      end
  end
