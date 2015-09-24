class AddCreatedByToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :created_by, :integer
  end
end
