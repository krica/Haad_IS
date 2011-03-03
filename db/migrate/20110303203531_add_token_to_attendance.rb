class AddTokenToAttendance < ActiveRecord::Migration
  def self.up
    add_column :attendances, :token, :string
  end

  def self.down
    remove_column :attendances, :token
  end
end
