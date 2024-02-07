class PostsController < ApplicationController
  helper_method :current_user
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(comments: :user).paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = current_user
    @post = Post.includes(comments: :user).find(params[:id])
    @new_like = Like.new
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post successfully created'
    else
      redirect_to new_user_post_path(@user), alert: 'Failed to create post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
