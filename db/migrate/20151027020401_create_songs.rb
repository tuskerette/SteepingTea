class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :url, null: false
      t.integer :length

      t.timestamps null: false
    end
  end
end
