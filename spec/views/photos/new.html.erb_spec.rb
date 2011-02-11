require 'spec_helper'

describe "/photos/new.html.erb" do
  include PhotosHelper

  before(:each) do
    assigns[:photo] = stub_model(Photo,
      :new_record? => true,
      :image_file_name => "value for image_file_name",
      :image_content_type => "value for image_content_type",
      :image_file_size => "value for image_file_size"
    )
  end

  it "renders new photo form" do
    render

    response.should have_tag("form[action=?][method=post]", photos_path) do
      with_tag("input#photo_image_file_name[name=?]", "photo[image_file_name]")
      with_tag("input#photo_image_content_type[name=?]", "photo[image_content_type]")
      with_tag("input#photo_image_file_size[name=?]", "photo[image_file_size]")
    end
  end
end
