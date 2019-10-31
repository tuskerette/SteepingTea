class RenameLengthColumnToDuration < ActiveRecord::Migration[4.2]
  def change
    rename_column :songs, :length, :duration
  end
end
