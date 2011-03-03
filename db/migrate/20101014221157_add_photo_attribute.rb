class AddPhotoAttribute < ActiveRecord::Migration
  def self.up
  #remove_column :photos, :image_updated_at
	#remove_column :photos, :description
    add_column :photos, :image_updated_at, :datetime
	add_column :photos, :description, :string
    change_column :photos, :image_file_size, :integer
  end

  def self.down
	remove_column :photos, :image_updated_at
	remove_column :photos, :description
  end
end
