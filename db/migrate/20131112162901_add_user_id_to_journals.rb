class AddUserIdToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :user_id, :integer
    add_index :journals, :user_id
  end
end
