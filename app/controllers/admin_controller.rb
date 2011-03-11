class AdminController < ApplicationController
   
  before_filter :admin_required

  def index

  end

  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(params[:user])
    if @user.save
      redirect_to :action => :index
    else
      redirect_to :action => :new_user
    end
  end
end
