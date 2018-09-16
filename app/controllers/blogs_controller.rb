class BlogsController < ApplicationController

      before_action :move_to_index, except: [:index, :show]

  def index
    @blogs = Blog.all.order("id DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
  end

  def edit
      @blog = Blog.find(params[:id])
  end

  def update
      blog = Blog.find(params[:id])
      blog.update(blog_params) if user_signed_in?
  end

  def destroy
      blog = Blog.find(params[:id])
      blog.destroy if user_signed_in?
  end


    private
    def blog_params
      params.require(:blog).permit(:title, :image, :text)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

end
