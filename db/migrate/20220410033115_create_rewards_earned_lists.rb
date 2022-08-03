class CreateRewardsEarnedLists < ActiveRecord::Migration[6.1]
  def change
    create_table :rewards_earned_lists do |t|
      t.string :reward_name
      t.integer :UID

      t.timestamps
    end
  end
end
