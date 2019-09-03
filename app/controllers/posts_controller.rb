class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
	#   @post = Post.new(params["post"])
	#   @post.save
	#   redirect_to post_path(@post)
		#above with 'strong params':
	#   @post = Post.new(params.require(:post).permit(:title, :description))
	#   @post.save
	#   redirect_to post_path(@post)
		#above DRYed up:
	  @post = Post.new(post_params)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	#   @post = Post.find(params[:id])
	#   @post.update(params["post"])
	#   redirect_to post_path(@post)
		#above with 'strong params':
	#   @post = Post.find(params[:id])
	#   @post.update(params.require(:post).permit(:title))
	#   redirect_to post_path(@post)
	  #above DRYed up:
	  @post = Post.find(params[:id])
	  @post.update(post_params)
	  redirect_to post_path(@post)
	end
	#the above altered create and update methods is telling Rails what parameters are allowed to be submitted through the form to the database. The default is to let nothing through, since we commented out 'config.action_controller.permit_all_parameters = true' in config/application.rb

	private

	def post_params
		params.require(:post).permit(:title, :description)
	end
	  	# We pass the permitted fields in as *args;
		# this keeps `post_params` DRY while
		# still allowing slightly different behavior
		# depending on the controller action
end
