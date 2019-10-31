class AddUserToSongs < ActiveRecord::Migration[4.2]
  def change
    add_reference :songs, :user, index: true, foreign_key: true
  end
end
