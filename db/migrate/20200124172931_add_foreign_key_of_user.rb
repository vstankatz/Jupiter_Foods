class AddForeignKeyOfUser < ActiveRecord::Migration[6.0]
  def change
    add_column(:products, :user_id, :integer)
    add_column(:reviews, :user_id, :integer)
    add_foreign_key :products, :users
    add_foreign_key :reviews, :users
  end
end
