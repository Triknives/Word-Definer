require 'rspec'
require 'dictionairy'

describe '#Word' do

  before(:each) do
    Dictionairy.clear()
    @word = Dictionairy.new('Yup', nil)
    @word.save
  end

  describe('#save') do
    it('saves a word') do
      expect(Dictionairy.all).to(eq([@word]))
    end
  end
  describe('.clear') do
    it('clears all words') do
      Dictionairy.clear
      expect(Dictionairy.all).to(eq([]))
    end
  end
  describe('.find') do
    it('finds a word by id') do
      @word2 = Dictionairy.new('please', nil)
      expect(Dictionairy.find(@word2.id)).to(eq(@Word2))
    end
  end
  describe('#update') do
    it('updates a word by id') do
      @word.update('yupper')
      expect(@word.name).to(eq('yupper'))
    end
  end
  describe('#update') do
    it('deletes a word by') do
      @word.delete
      expect(Dictionairy.all).to(eq([]))
    end
  end
end
