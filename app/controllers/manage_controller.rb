class ManageController < ApplicationController
  before_filter :admin_required
  
  layout "application"

  def index

  end

  def list_attendances
    @users = User.all
    @users.sort!{|x,y| x.surname.downcase <=> y.surname.downcase}
  end

end
