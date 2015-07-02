module FlickrHelper

	def photo_urls(user_id)
		photo_urls = []
		photo_list = flickr.photos.search(:user_id => user_id)
		photo_list.each do |photo|
			photo_urls << FlickRaw.url(photo)
		end
		photo_urls
	end
end