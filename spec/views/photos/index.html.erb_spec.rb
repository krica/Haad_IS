require 'spec_helper'

describe "/photos/index.html.erb" do
  include PhotosHelper

  before(:each) do
    assigns[:photos] = [
      stub_model(Photo,
        :image_file_name => "value for image_file_name",
        :image_content_type => "value for image_content_type",
        :image_file_size => "value for image_file_size"
      ),
      stub_model(Photo,
        :image_file_name => "value for image_file_name",
        :image_content_type => "value for image_content_type",
        :image_file_size => "value for image_file_size"
      )
    ]
  end

  it "renders a list of photos" do
    render
    response.should have_tag("tr>td", "value for image_file_name".to_s, 2)
    response.should have_tag("tr>td", "value for image_content_type".to_s, 2)
    response.should have_tag("tr>td", "value for image_file_size".to_s, 2)
  end
end
