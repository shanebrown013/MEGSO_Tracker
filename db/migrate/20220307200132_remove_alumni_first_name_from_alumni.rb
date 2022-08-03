class RemoveAlumniFirstNameFromAlumni < ActiveRecord::Migration[6.1]
  def change
    remove_column :alumnis, :alumni_first_name, :string
  end
end
