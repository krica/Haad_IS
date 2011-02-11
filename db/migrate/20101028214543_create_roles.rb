class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
    end
	create_table :roles_users do |t|
	  t.integer :role_id
	  t.integer :user_id
	  t.timestamps
    end
	Role.create(:name => "admin")
  end

  def self.down
    drop_table :roles
	drop_table :roles_users
  end
end
