class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :body
      t.integer :user_id
      t.datetime :schedule_time
      t.integer :patient_id

      t.timestamps
    end
  end
end
