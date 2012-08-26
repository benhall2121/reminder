class ReminderTasksController < ApplicationController
  # GET /reminder_tasks
  # GET /reminder_tasks.xml
  def index
    @reminder_tasks = ReminderTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reminder_tasks }
    end
  end

  # GET /reminder_tasks/1
  # GET /reminder_tasks/1.xml
  def show
    @reminder_task = ReminderTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reminder_task }
    end
  end

  # GET /reminder_tasks/new
  # GET /reminder_tasks/new.xml
  def new
    @reminder_task = ReminderTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reminder_task }
    end
  end

  # GET /reminder_tasks/1/edit
  def edit
    @reminder_task = ReminderTask.find(params[:id])
  end

  # POST /reminder_tasks
  # POST /reminder_tasks.xml
  def create
    @reminder_task = ReminderTask.new(params[:reminder_task])

    respond_to do |format|
      if @reminder_task.save
        format.html { redirect_to(@reminder_task, :notice => 'Reminder task was successfully created.') }
        format.xml  { render :xml => @reminder_task, :status => :created, :location => @reminder_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reminder_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reminder_tasks/1
  # PUT /reminder_tasks/1.xml
  def update
    @reminder_task = ReminderTask.find(params[:id])

    respond_to do |format|
      if @reminder_task.update_attributes(params[:reminder_task])
        format.html { redirect_to(@reminder_task, :notice => 'Reminder task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reminder_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reminder_tasks/1
  # DELETE /reminder_tasks/1.xml
  def destroy
    @reminder_task = ReminderTask.find(params[:id])
    @reminder_task.destroy

    respond_to do |format|
      format.html { redirect_to(reminder_tasks_url) }
      format.xml  { head :ok }
    end
  end
end
