class PostsController < ApplicationController
	
	before_filter :check_signed_in, only: [:new, :create]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = @current_user.id
		@post.save
		redirect_to posts_url
	end

	def index
		@posts = Post.all
	end

	private

		def check_signed_in
			unless signed_in?
				redirect_to root_url
			end
		end

		def post_params
			params.require(:post).permit(:title, :body)
		end
end