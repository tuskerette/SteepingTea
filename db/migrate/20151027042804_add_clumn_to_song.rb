class AddClumnToSong < ActiveRecord::Migration[4.2]
  def change
    add_column :songs, :comment, :string
  end
end
