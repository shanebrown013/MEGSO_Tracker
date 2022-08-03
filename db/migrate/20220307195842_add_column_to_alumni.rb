class AddColumnToAlumni < ActiveRecord::Migration[6.1]
  def change
    add_column :alumnis, :highest_position, :string
  end
end
