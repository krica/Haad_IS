module UsersHelper
  def user_small_picture(user)
    if !user.attendances.last.nil?
      image_tag(Photo.find(user.attendances.last.start_photo_id.to_s).image.url(:thumb), :size => "30x23", :style => "border: 0px;margin-bottom: -5px;")
    else
      image_tag("user_icon.png", :size => "30x23", :style => "border: 0px;margin-bottom: -5px;")
    end
  end
  
  def user_show_picture(user)
    if !user.attendances.last.nil?
      image_tag(Photo.find(user.attendances.last.start_photo_id.to_s).image.url(:thumb), :size => "133x100", :style => "margin-left: 10px;")
    else
      image_tag("user_icon.png", :size => "133x100", :style => "margin-left: 10px;")
    end

  end
end
