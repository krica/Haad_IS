class UsersController < ApplicationController
  before_filter :adjust_format_for_iphone, :only => [:login, :show, :index]
  before_filter :login_required, :except => [:login, :verify_user]
  before_filter :admin_required, :only => [:new, :edit, :index, :update, :destroy, :create]
  layout "application"

  def list
    @users = User.all
    respond_to do |format|
      format.iphone {render :layout => "iphone"} 
    end
  end

  def verify_user
    if params[:card].present? && @user = User.find_by_card(params[:card])
      session[:user_id] = @user.id
      redirect_to "/attendances"
    else
      redirect_to "/"
    end
  end
 
  def login
    logout_user
    @count = User.now_working_count
    respond_to do |format|
      format.html { render :layout => "first" }# index.html.erb
      format.iphone {render :layout => "iphone"} 
    end
  end

  # GET /users
  # GET /users.xml
  def index
    @users = User.all
    @users.sort!{|x,y| x.surname.downcase <=> y.surname.downcase}
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.iphone { render :layout => "iphone"}
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.iphone { render :layout => "iphone"}
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        if params[:admin] == "true"
          @user.roles << Role.find_by_name("admin")
        end
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to "/users" }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
	@user.roles.delete(Role.find_by_name("admin"))
        if params[:admin] == "true"
          @user.roles << Role.find_by_name("admin")          
        end
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to '/users' }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to "/users" }
      format.xml  { head :ok }
    end
  end
end
