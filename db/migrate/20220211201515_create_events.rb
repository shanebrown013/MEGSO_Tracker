class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.integer :event_point
      t.string :event_location
      t.date :event_date
      t.time :event_start
      t.time :event_end
      t.string :event_verification
      t.string :event_attendee_list_id

      t.timestamps
    end
  end
end
