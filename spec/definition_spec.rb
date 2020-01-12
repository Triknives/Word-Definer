require 'rspec'
require 'dictionairy'
require 'definition'

describe '#definition' do

  before(:each) do
    Dictionairy.clear
    Definition.clear
    @word = Dictionairy.new('Yup', nil)
    @word.save
    @word2 = Dictionairy.new('Yes', nil)
    @word2.save
  end

  describe('#save') do
    it('saves a definition') do
      definition = Definition.new("Casual affirmation", @word.id, nil)
      definition.save
      expect(Definition.all).to(eq([definition]))
    end
  end
  describe('.clear') do
    it('clears all definitions') do
      definition = Definition.new("Casual affirmation", @word.id, nil)
      definition.save
      Definition.clear
      expect(Definition.all).to(eq([]))
    end
  end
  describe('.find') do
    it('finds a word definition by id') do
      definition = Definition.new("Casual affirmation", @word.id, nil)
      definition.save
      definition2 = Definition.new("Formal affirmation", @word.id, nil)
      definition2.save
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end
  describe('#update') do
    it('updates a word by id') do
      definition = Definition.new("Casual affirmation", @word.id, nil)
      definition.save
      definition.update('slang, for yes or agreement', @word.id)
      expect(definition.definitions).to(eq('slang, for yes or agreement'))
    end
  end
  describe('#delete') do
    it('deletes a word by id') do
      definition = Definition.new("Casual affirmation", @word.id, nil)
      definition.save
      definition2 = Definition.new("Formal affirmation", @word.id, nil)
      definition2.save
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end
end
