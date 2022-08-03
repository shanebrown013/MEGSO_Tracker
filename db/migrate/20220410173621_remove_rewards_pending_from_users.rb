class RemoveRewardsPendingFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :rewards_pending, :integer
  end
end
