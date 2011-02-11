require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :card => "value for card",
      :name => "value for name",
      :surname => "value for surname",
      :email => "value for email",
      :phone => "value for phone",
      :photo_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
