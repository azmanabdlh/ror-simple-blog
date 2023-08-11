class PostsController < ApplicationController
  def index
    @posts = PostsRepository.find_all
  end

  def show
    @post = PostsRepository.find_by_slug(params[:slug])
    if @post.nil?
      return render_404
    end
  end

  def new
    @post = Post.new
  end

  def store   
   req = params.require(:post).permit(:title, :body)
   PostsRepository.save(req)

   return redirect_to "/posts"
  end

end
