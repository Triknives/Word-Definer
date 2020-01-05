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
    it('finds an word by id') do
      expect(Dictionairy.find(@word.id)).to(eq(@Word))
    end
  end
end
