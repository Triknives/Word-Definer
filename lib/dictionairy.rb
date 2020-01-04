class Dictionairy
  attr_reader :name, :id
  @@words = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Dictionairy.new(self.name, self.id)
  end

  def ==(name_to_compare)
    self.name() == name_to_compare.name()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def self.sort
    @@words.values.sort { |a, b| a.name <=> b.name }
  end

  def update(name)
    @name = (name == "") ? self.name : name
  end

  def delete
    @@words.delete(self.id)
  end

  def definition
    Definition.find_by_word(self.id)
  end
end
