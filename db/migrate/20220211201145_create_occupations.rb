class CreateOccupations < ActiveRecord::Migration[6.1]
  def change
    create_table :occupations do |t|
      t.string :occupation_role
      t.string :occupation_company
      t.string :occupation_location

      t.timestamps
    end
  end
end
