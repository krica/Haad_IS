class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :card
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.integer :photo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
