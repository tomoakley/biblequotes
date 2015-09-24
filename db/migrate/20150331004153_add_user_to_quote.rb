class AddUserToQuote < ActiveRecord::Migration
  def change
    add_reference :quotes, :user, index: true
    add_foreign_key :quotes, :users
  end
end
