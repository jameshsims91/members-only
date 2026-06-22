class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.expect(post: [ :title, :body, :user_id ])
  end
end
