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
   user = User.find_by(id: session[:user_id])
   req[:slug] = req[:title].strip.parameterize
   post = user.posts.build(req)
   if post.invalid?
      flash[:error] = post.errors.full_messages.join(", ")
   end

   post.save

  #  no used
  #  PostsRepository.save(req)

   return redirect_to "/posts"
  end

end
