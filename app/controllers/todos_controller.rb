class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  
  def index
    @todos = Todo.all
    @todo = Todo.new
  end
  
  def show
  end
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render turbo_stream: turbo_stream.append('todos', partial: 'todo_partial', locals: { todo: @todo }),
             notice: 'Task was successfully created.'
    else
      render :new
    end
  end
  
  def update
    if @todo.update(todo_params)
      render turbo_stream: turbo_stream.replace('todos', partial: 'todo_partial', locals: { todo: @todo }),
             notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end
  
  def edit
  end
  
  def destroy
    @todo.destroy
    render turbo_stream: turbo_stream.remove('todos', partial: 'todo_partial', locals: { todo: @todo }),
           notice: 'Task was successfully deleted.'
  end
  
  private
  
  def set_todo
    @todo = Todo.find(params[:id])
  end
  
  def todo_params
    params.require(:todo).permit(:name, :description, :status)
  end
end

