class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :movies, :Director, :director
  end
end
