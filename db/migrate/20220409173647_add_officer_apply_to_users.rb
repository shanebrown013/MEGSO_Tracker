class AddOfficerApplyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :officer_apply, :boolean
  end
end