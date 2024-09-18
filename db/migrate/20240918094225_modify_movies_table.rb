class ModifyMoviesTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :capacity, :integer

    add_column :movies, :duration, :integer
  end
end
