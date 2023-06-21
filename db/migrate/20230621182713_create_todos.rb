class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.references :user, foreign_key: true  # Add this line to create the foreign key column
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
