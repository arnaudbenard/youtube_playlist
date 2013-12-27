class Jukebox < ActiveRecord::Base
	has_many :videos

	def self.search_on_youtube(query)
		client = YouTubeIt::Client.new
		client.videos_by(:query => query,:max_results => 10)
	end
end
