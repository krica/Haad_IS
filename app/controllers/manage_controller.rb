class ManageController < ApplicationController
  before_filter :admin_required
  
  layout "application"

  def index

  end

  def list_attendances
    @users = User.all
    @users.sort!{|x,y| x.display_name <=> y.display_name}
  end

end
