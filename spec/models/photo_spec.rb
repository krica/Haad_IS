require 'spec_helper'

describe Photo do
  before(:each) do
    @valid_attributes = {
      :image_file_name => "value for image_file_name",
      :image_content_type => "value for image_content_type",
      :image_file_size => "value for image_file_size"
    }
  end

  it "should create a new instance given valid attributes" do
    Photo.create!(@valid_attributes)
  end
end
