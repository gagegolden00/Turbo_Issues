class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
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
      #  'todos' refers to ID in partial
      render turbo_stream: turbo_stream.append('todos', partial: 'todo_partial', locals: {todo: @todo}),
      notice: 'Task was successfully created.'
    else
      render :new
    end
  end
  
  def update
    if @todo.update(page_params)
      render turbo_stream: turbo_stream.replace('todos', partial: 'todo_partial', locals: {todo: @todo}),
             notice: 'Tasks were updated.'
    else
      render :edit
    end
  end
  
  def edit
  end
  
  def destroy
    @todo.destroy
    render turbo_stream: turbo_stream.remove('todos', partial: 'todo_partial', locales: {todo: @todo}),
           notice: 'Task was successfully deleted.'
  end
  
  private
  
  def set_todo
    @todo = Todo.find(params[:id])
  end
  
  def page_params
    params.require(:todo).permit(:name)
  end
  
end
