class AddNameToAlumni < ActiveRecord::Migration[6.1]
  def change
    add_column :alumnis, :alumni_name, :string
  end
end
