class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :UID
      t.boolean :is_admin
      t.boolean :is_officer
      t.boolean :position
      t.integer :points
      t.integer :rewards_earned

      t.timestamps
    end
  end
end
