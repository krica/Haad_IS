class Photo < ActiveRecord::Base
 
  require 'mini_magick'
  
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end

