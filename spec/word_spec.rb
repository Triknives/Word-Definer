require 'rspec'
require 'definition'
require 'word'

describe '#Word' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new('Giant Steps', nil)
    @word.save
  end

  describe('') do
    it() do
      word = Word.new()
      word2 = Word.new()
      expect(word).to(eq(word2))
    end
  end
end
