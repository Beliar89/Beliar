class AddIndexToTopmovies < ActiveRecord::Migration[5.1]
  def change
    add_column :topmovies, :pelicula_id, :integer
    add_index :topmovies, :pelicula_id
  end
end
