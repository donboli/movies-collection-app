class AddPicturesToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :pictures, :json
  end
end
