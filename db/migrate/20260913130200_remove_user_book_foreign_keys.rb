class RemoveUserBookForeignKeys < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :user_books, :users, if_exists: true
    remove_foreign_key :user_books, :books, if_exists: true
  end
end
