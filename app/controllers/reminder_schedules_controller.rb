class ReminderSchedulesController < ApplicationController
  # GET /reminder_schedules
  # GET /reminder_schedules.xml
  def index
    @reminder_schedules = ReminderSchedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reminder_schedules }
    end
  end

  # GET /reminder_schedules/1
  # GET /reminder_schedules/1.xml
  def show
    @reminder_schedule = ReminderSchedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reminder_schedule }
    end
  end

  # GET /reminder_schedules/new
  # GET /reminder_schedules/new.xml
  def new
    @reminder_schedule = ReminderSchedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reminder_schedule }
    end
  end

  # GET /reminder_schedules/1/edit
  def edit
    @reminder_schedule = ReminderSchedule.find(params[:id])
  end

  # POST /reminder_schedules
  # POST /reminder_schedules.xml
  def create
    @reminder_schedule = ReminderSchedule.new(params[:reminder_schedule])

    respond_to do |format|
      if @reminder_schedule.save
        format.html { redirect_to(@reminder_schedule, :notice => 'Reminder schedule was successfully created.') }
        format.xml  { render :xml => @reminder_schedule, :status => :created, :location => @reminder_schedule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reminder_schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reminder_schedules/1
  # PUT /reminder_schedules/1.xml
  def update
    @reminder_schedule = ReminderSchedule.find(params[:id])

    respond_to do |format|
      if @reminder_schedule.update_attributes(params[:reminder_schedule])
        format.html { redirect_to(@reminder_schedule, :notice => 'Reminder schedule was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reminder_schedule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reminder_schedules/1
  # DELETE /reminder_schedules/1.xml
  def destroy
    @reminder_schedule = ReminderSchedule.find(params[:id])
    @reminder_schedule.destroy

    respond_to do |format|
      format.html { redirect_to(reminder_schedules_url) }
      format.xml  { head :ok }
    end
  end
end
