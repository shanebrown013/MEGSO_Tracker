class RemoveAlumniOccupationFromAlumni < ActiveRecord::Migration[6.1]
  def change
    remove_column :alumnis, :alumni_occupation, :string
  end
end
