# json.array! @songs, partial: 'songs/song', as: :song

json.array!(@songs) do |song|
  json.extract! song, :id, :title, :created_at, :updated_at
  json.url song_url(song, format: :json)
end
