class AddImageAndCapacityToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :image_file_name, :string, default: "placeholder.png"
    add_column :movies, :capacity, :integer, default: 1
  end
end
