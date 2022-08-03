class RemoveAlumniLastNameFromAlumni < ActiveRecord::Migration[6.1]
  def change
    remove_column :alumnis, :alumni_last_name, :string
  end
end
