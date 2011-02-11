class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.datetime :start
      t.datetime :end
      t.integer :start_photo_id
      t.integer :end_photo_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
