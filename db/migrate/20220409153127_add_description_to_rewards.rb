class AddDescriptionToRewards < ActiveRecord::Migration[6.1]
  def change
    add_column :rewards, :reward_description, :text
  end
end
