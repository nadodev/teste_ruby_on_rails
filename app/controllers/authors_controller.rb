class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
    # Inicialize um novo autor com os parâmetros recebidos
    @author = Author.new(author_params)
  
    if @author.save
      redirect_to authors_path, notice: 'Author was successfully created.'
    else
      # Adicione mensagens de log para depuração
      puts "Errors: #{@author.errors.full_messages}"
      render :new
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to authors_path, notice: 'Author was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path, notice: 'Author was successfully destroyed.'
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end