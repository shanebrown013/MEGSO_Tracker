class AddDescriptionToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :event_description, :text
  end
end
