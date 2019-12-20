class Dictionairy
  attr_reader :name, :id
  @@words = {}
  @@total_rows = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Dictionairy.new(self.word, self.id)
  end

  def ==(album_to_compare)
    self.word() == album_to_compare.word()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def self.sort
    @@words.values.sort { |a, b| a.word <=> b.word }
  end

  def update(word)
    @word = (word != '') ? word : @word

  def delete
    @@words.delete(self.id)
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end
