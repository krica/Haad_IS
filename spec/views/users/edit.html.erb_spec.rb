require 'spec_helper'

describe "/users/edit.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = @user = stub_model(User,
      :new_record? => false,
      :card => "value for card",
      :name => "value for name",
      :surname => "value for surname",
      :email => "value for email",
      :phone => "value for phone",
      :photo_id => 1
    )
  end

  it "renders the edit user form" do
    render

    response.should have_tag("form[action=#{user_path(@user)}][method=post]") do
      with_tag('input#user_card[name=?]', "user[card]")
      with_tag('input#user_name[name=?]', "user[name]")
      with_tag('input#user_surname[name=?]', "user[surname]")
      with_tag('input#user_email[name=?]', "user[email]")
      with_tag('input#user_phone[name=?]', "user[phone]")
      with_tag('input#user_photo_id[name=?]', "user[photo_id]")
    end
  end
end
