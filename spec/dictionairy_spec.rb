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
end
