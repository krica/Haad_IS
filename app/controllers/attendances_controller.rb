class AttendancesController < ApplicationController
 
  before_filter :adjust_format_for_iphone, :only => [:list]

  layout "application"
  
  def list
    @users = User.now_working
    respond_to do |format|
      format.iphone {render :layout => "iphone"} 
    end
  end

  # GET /attendances
  # GET /attendances.xml
  def index
    @user = User.find(session[:user_id])
  end

  # GET /attendances/1
  # GET /attendances/1.xml
  def show
    @user = User.find(params[:id])
    if !params[:date].nil?
      begin
        from = DateTime.new(y=params[:date]["from(1i)"].to_i, m=params[:date]["from(2i)"].to_i, d=params[:date]["from(3i)"].to_i, h=0, min=0, s=0)
        to = DateTime.new(y=params[:date]["to(1i)"].to_i, m=params[:date]["to(2i)"].to_i, d=params[:date]["to(3i)"].to_i, h=0, min=0, s=0)
      rescue
        from = Time.now
        to = Time.now
        flash[:notice] = "vybrane datum neni platne"
      end
      @attendances = Attendance.find(:all, :conditions => ["start > ? AND end < ?  AND user_id = ? ", from, to+1.day, @user.id])
      @attendances = @attendances + Attendance.find(:all, :conditions => ["start > ? AND start < ? AND end IS NULL  AND user_id = ? ", from, to+1.day, @user.id])
    else
      @attendances = @user.attendances
    end
    @attendances.sort! {|x,y| y.id <=> x.id}
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.xml
  def new
    @attendance = Attendance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.xml
  def create
    @attendance = Attendance.new(params[:attendance])

    respond_to do |format|
      if @attendance.save
        flash[:notice] = 'Attendance was successfully created.'
        format.html { redirect_to(@attendance) }
        format.xml  { render :xml => @attendance, :status => :created, :location => @attendance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attendance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.xml
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        flash[:notice] = 'Attendance was successfully updated.'
        format.html { redirect_to(@attendance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attendance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.xml
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to(attendances_url) }
      format.xml  { head :ok }
    end
  end
end
