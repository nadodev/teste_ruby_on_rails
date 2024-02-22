class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :load_authors, only: [:new, :edit]
  def index
    begin
      if params[:search].present?
        @posts = Post.where("title LIKE ?", "%#{params[:search]}%")
      else
        response = NewsApiService.top_headlines(page_size: 10)
        @api_articles = JSON.parse(response.body)['articles']
        @api_articles = Kaminari.paginate_array(@api_articles).page(params[:page]).per(10)
        @posts = Post.all
      end
    rescue StandardError => e
      flash.now[:error] = "Erro ao obter notícias: #{e.message}"
      @posts = Post.all
    end
  end

  def show
    UpdateNewsWorker.perform_async(@post.id)
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
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post foi atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post deletado com sucesso!'
    else
      flash[:error] = 'Erro ao deletar o post.'
    end
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :published_at, :author_id, :category, :fontes)
  end

  def load_authors
    @authors = Author.all
  end
end