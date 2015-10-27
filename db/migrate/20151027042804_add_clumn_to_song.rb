class AddClumnToSong < ActiveRecord::Migration
  def change
    add_column :songs, :comment, :string
  end
end
