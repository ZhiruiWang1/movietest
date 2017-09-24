require 'rubygems'
require 'httparty'

class Apitest
	include HTTParty
	base_uri "localhost:3000/"

	def posts
		self.class.get('/posts/14')
	end
end

api_test = Apitest.new
puts api_test.posts