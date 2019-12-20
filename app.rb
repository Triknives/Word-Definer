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
  @word.update(values[1]) #keep an eye on this when updating to see which value does change.
  @words = Dictionairy.all
  erb(:words)
end

delete('/words/:id') do
  @word = Dictionairy.find(params[:id].to_i())
  @word.delete()
  @words = Dictionary.all
  erb(:words)
end

# Get the detail for a specific song such as lyrics and songwriters.
get('/words/:id/definitions/:word_id') do
  @song = Song.find(params[:song_id].to_i())
  erb(:songs)
end

# Post a new song. After the song is added, Sinatra will route to the view for the album the song belongs to.
post('/words/:id/definitions') do
  @album = Album.find(params[:id].to_i())
  song = Song.new(params[:song_name], @album.id, nil)
  song.save()
  erb(:album)
end

# Edit a song and then route back to the album view.
patch('/words/:id/definitions/:word_id') do
  @album = Album.find(params[:id].to_i())
  song = Song.find(params[:song_id].to_i())
  song.update(params[:name], @album.id)
  erb(:album)
end

# Delete a song and then route back to the album view.
delete('/words/:id/definitions/:wrong_id') do
  song = Song.find(params[:song_id].to_i())
  song.delete
  @album = Album.find(params[:id].to_i())
  erb(:album)
end
