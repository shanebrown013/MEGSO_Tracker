class CreateRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :rewards do |t|
      t.string :reward_name
      t.integer :reward_points

      t.timestamps
    end
  end
end
