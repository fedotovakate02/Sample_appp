class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
  	add_index :users, :emails, unique: true
  end
end
