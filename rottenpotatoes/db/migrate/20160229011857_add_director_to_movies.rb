class AddDirectorToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :Director, :string
  end
end
