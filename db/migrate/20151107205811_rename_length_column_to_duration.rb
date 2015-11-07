class RenameLengthColumnToDuration < ActiveRecord::Migration
  def change
    rename_column :songs, :length, :duration
  end
end
