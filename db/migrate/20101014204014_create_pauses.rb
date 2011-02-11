class CreatePauses < ActiveRecord::Migration
  def self.up
    create_table :pauses do |t|
      t.datetime :start
      t.datetime :end
      t.integer :start_photo_id
      t.integer :end_photo_id
      t.integer :attendance_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pauses
  end
end
