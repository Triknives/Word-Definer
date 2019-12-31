class Definition
    attr_reader :id
    attr_accessor :word, :word_id

    @@definitions = {}
    @@total_rows = 0

    def initialize(definition, word_id, id)
      @definition = definition
      @word_id = word_id
      @id = id || @@total_rows += 1
    end

    def ==(song_to_compare)
      (self.definition() == song_to_compare.definition()) && (self.word_id() == song_to_compare.word_id())
    end

    def self.all
      @@definitions.values
    end

    def save
      @@definitions[self.id] = Definition.new(self.word, self.word_id, self.id)
    end

    def self.find(id)
      @@definitions[id]
    end

    def update(word, word_id)
      self.word = word
      self.word_id = word_id
      @@definitions[self.id] = Definition.new(self.word, self.word_id, self.id)
    end

    def delete
      @@definitions.delete(self.id)
    end

    def self.clear
      @@definitions = {}
    end

    def self.find_by_word(wrd_id)
    words = []
    @@definitions.values.each do |word|
      if word.word_id == wrd_id
        words.push(word)
      end
    end
    words
  end

    def word
        Dictionairy.find(self.word_id)
      end
  end
