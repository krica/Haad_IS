require 'spec_helper'

describe "/pauses/edit.html.erb" do
  include PausesHelper

  before(:each) do
    assigns[:pause] = @pause = stub_model(Pause,
      :new_record? => false,
      :start_photo_id => 1,
      :end_photo_id => 1,
      :attendance_id => 1
    )
  end

  it "renders the edit pause form" do
    render

    response.should have_tag("form[action=#{pause_path(@pause)}][method=post]") do
      with_tag('input#pause_start_photo_id[name=?]', "pause[start_photo_id]")
      with_tag('input#pause_end_photo_id[name=?]', "pause[end_photo_id]")
      with_tag('input#pause_attendance_id[name=?]', "pause[attendance_id]")
    end
  end
end
