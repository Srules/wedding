json.extract! song, :id, :title, :artist, :url, :suggested_by, :votes, :created_at, :updated_at
json.url song_url(song, format: :json)
