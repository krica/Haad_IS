class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :image_file_name
      t.string :image_content_type
      t.string :image_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
