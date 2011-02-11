require 'spec_helper'

describe "/photos/show.html.erb" do
  include PhotosHelper
  before(:each) do
    assigns[:photo] = @photo = stub_model(Photo,
      :image_file_name => "value for image_file_name",
      :image_content_type => "value for image_content_type",
      :image_file_size => "value for image_file_size"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ image_file_name/)
    response.should have_text(/value\ for\ image_content_type/)
    response.should have_text(/value\ for\ image_file_size/)
  end
end
