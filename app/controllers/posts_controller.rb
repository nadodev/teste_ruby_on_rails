class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  before_action :load_authors, only: [:new, :edit]

  def index
    @posts = if params[:search]
      Post.where("title LIKE ?", "%#{params[:search]}%")
    else
      Post.all
    end
  end

  def show
    @post = Post.includes(:author).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  
    if @post.save
      flash[:success] = 'Post criado com sucesso!'
      redirect_to posts_path
    else
       flash[:error] = 'Erro ao criar o post. Por favor, verifique os campos.'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    if @post.destroy
    flash[:success] = 'Post deletado com sucesso!'
    redirect_to posts_url
    else
      flash[:error] = 'Erro ao deletar o post.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :published_at, :author_id)
  end

  def load_authors
    @authors = Author.all
  end
end
