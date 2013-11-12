class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :body

      t.timestamps
    end
  end
end
