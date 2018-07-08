class AddNametoUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string #add a new column to "users", called "name" and of type "string"
  end
end
