class AddRewardsPendingToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :rewards_pending, :integer
  end
end
