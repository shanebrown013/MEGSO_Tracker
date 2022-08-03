class CreateEventVerifications < ActiveRecord::Migration[6.1]
  def change
    create_table :event_verifications do |t|
      t.string :event_verification
      t.integer :event_id

      t.timestamps
    end
  end
end
