require 'spec_helper'

describe "/pauses/new.html.erb" do
  include PausesHelper

  before(:each) do
    assigns[:pause] = stub_model(Pause,
      :new_record? => true,
      :start_photo_id => 1,
      :end_photo_id => 1,
      :attendance_id => 1
    )
  end

  it "renders new pause form" do
    render

    response.should have_tag("form[action=?][method=post]", pauses_path) do
      with_tag("input#pause_start_photo_id[name=?]", "pause[start_photo_id]")
      with_tag("input#pause_end_photo_id[name=?]", "pause[end_photo_id]")
      with_tag("input#pause_attendance_id[name=?]", "pause[attendance_id]")
    end
  end
end
