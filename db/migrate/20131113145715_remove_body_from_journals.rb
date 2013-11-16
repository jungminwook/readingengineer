class RemoveBodyFromJournals < ActiveRecord::Migration
  def change
    remove_column :journals, :body, :string
  end
end
