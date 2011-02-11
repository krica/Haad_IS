require 'spec_helper'

describe "/users/index.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:users] = [
      stub_model(User,
        :card => "value for card",
        :name => "value for name",
        :surname => "value for surname",
        :email => "value for email",
        :phone => "value for phone",
        :photo_id => 1
      ),
      stub_model(User,
        :card => "value for card",
        :name => "value for name",
        :surname => "value for surname",
        :email => "value for email",
        :phone => "value for phone",
        :photo_id => 1
      )
    ]
  end

  it "renders a list of users" do
    render
    response.should have_tag("tr>td", "value for card".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for surname".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for phone".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
