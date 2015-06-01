class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create]

	def all
		@posts = Post.all
	end
	
	def new
		@post = Post.new
	end
	
	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to root_path
	end
	
	def post_params
		params.require(:post).permit(:title, :body)
	end

	def signed_in_user
		redirect_to logout_url unless signed_in?
	end
end
