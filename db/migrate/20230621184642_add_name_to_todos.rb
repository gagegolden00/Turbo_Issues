class AddNameToTodos < ActiveRecord::Migration[7.0]
  def change
    add_column :todos, :name, :string, null: false
  end
end
