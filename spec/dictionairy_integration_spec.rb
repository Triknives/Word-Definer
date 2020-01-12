require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word!')
    fill_in('dictionairy_word', :with => 'Yellow')
    click_on('Go!')
    expect(page).to have_content('Yellow')
  end
end
#
describe('create a definition path', {:type => :feature}) do
    it('creates a word and then goes to the word page') do
      word = Dictionairy.new("yes", nil)
      word.save
      visit("/words/#{word.id}")
      fill_in('definition_word', :with => 'Positive affirmation')
      click_on('Update definition')
      expect(page).to have_content('Positive affirmation')
    end
  end
