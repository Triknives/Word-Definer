require('sinatra')
require('sinatra/reloader')
require('./lib/dictionairy')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  erb(:landing_page)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  @word= Dictionairy.find(params[:id].to_i())
  erb(:word)
end

get('/words') do
  values = *params.values
  word = Dictionairy.new(values[0], nil)
  word.save()
  @words = Dictionairy.all() # Adding this line will fix the error.
  erb(:words)
end

post('/words') do
  values = *params.values
  word = Dictionairy.new(values[0], nil)
  word.save()
  @words = Dictionairy.all() # Adding this line will fix the error.
  erb(:words)
end

get('/words/:id/edit') do
  @word = Dictionairy.find(params[:id].to_i())
  erb(:edit_word)
end

patch('/words/:id') do
  @word = Dictionairy.find(params[:id].to_i())
  values = *params.values
  @word.update(params[:word_name]) #keep an eye on this when updating to see which value does change.
  @words = Dictionairy.all
  erb(:words)
end

delete('/words/:id') do
  @word = Dictionairy.find(params[:id].to_i())
  @word.delete()
  @words = Dictionary.all
  erb(:words)
end

# Get the detail for a specific word such as definition
get('/words/:id/definitions/:word_id') do
  @definition = Definition.find(params[:word_id].to_i())
  erb(:definitions)
end

# Post a new definition. After the definition is added, Sinatra will route to the view for the word the definition belongs to.
post('/words/:id/definitions') do
  @word = Dictionairy.find(params[:id].to_i())
  definition = Definition.new(params[:definition_word],  @word.id, nil) #come back to definition_word, ensure its correct
  definition.save()
  erb(:word)
end

# Edit a definition and then route back to the word view.
patch('/words/:id/definitions/:word_id') do
  @word = Dictionairy.find(params[:id].to_i())
  definition = Definition.find(params[:word_id].to_i())
  definition.update(params[:name], @word.id)
  erb(:word)
end

# Delete a song and then route back to the word view.
delete('/words/:id/definitions/:word_id') do
  definition = Definition.find(params[:word_id].to_i())
  definition.delete
  @word = Dictionairy.find(params[:id].to_i())
  erb(:word)
end
