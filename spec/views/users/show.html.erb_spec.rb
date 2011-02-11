require 'spec_helper'

describe "/users/show.html.erb" do
  include UsersHelper
  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :card => "value for card",
      :name => "value for name",
      :surname => "value for surname",
      :email => "value for email",
      :phone => "value for phone",
      :photo_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ card/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ surname/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ phone/)
    response.should have_text(/1/)
  end
end
