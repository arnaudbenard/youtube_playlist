json.array!(@jukeboxes) do |jukebox|
  json.extract! jukebox, :id, :title, :list
  json.url jukebox_url(jukebox, format: :json)
end
