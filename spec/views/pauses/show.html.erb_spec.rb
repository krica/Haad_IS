require 'spec_helper'

describe "/pauses/show.html.erb" do
  include PausesHelper
  before(:each) do
    assigns[:pause] = @pause = stub_model(Pause,
      :start_photo_id => 1,
      :end_photo_id => 1,
      :attendance_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
