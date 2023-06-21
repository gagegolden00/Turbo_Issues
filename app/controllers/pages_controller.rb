class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  
  def home
  end
  
  def index
    @todos = Todo.all
  end
  
  def show
  end
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(page_params)
    
    if @todo.save
      redirect_to @todo, notice: 'Page was successfully created.'
    else
      render :new
    end
  end
  
  def update
    if @todo.update(page_params)
      redirect_to @todo, notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end
  
  def edit
  end
  
  def destroy
    @todo.destroy
    redirect_to pages_url, notice: 'Page was successfully destroyed.'
  end
  
  private
  
  def set_page
    @todo = Todo.find(params[:id])
  end
  
  def page_params
    params.require(:todo).permit(:name)
  end
end

