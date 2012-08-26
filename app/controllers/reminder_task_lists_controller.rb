class ReminderTaskListsController < ApplicationController
  # GET /reminder_task_lists
  # GET /reminder_task_lists.xml
  def index
    @reminder_task_lists = ReminderTaskList.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reminder_task_lists }
    end
  end

  # GET /reminder_task_lists/1
  # GET /reminder_task_lists/1.xml
  def show
    @reminder_task_list = ReminderTaskList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reminder_task_list }
    end
  end

  # GET /reminder_task_lists/new
  # GET /reminder_task_lists/new.xml
  def new
    @reminder_task_list = ReminderTaskList.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reminder_task_list }
    end
  end

  # GET /reminder_task_lists/1/edit
  def edit
    @reminder_task_list = ReminderTaskList.find(params[:id])
  end

  # POST /reminder_task_lists
  # POST /reminder_task_lists.xml
  def create
    @reminder_task_list = ReminderTaskList.new(params[:reminder_task_list])

    respond_to do |format|
      if @reminder_task_list.save
        format.html { redirect_to(@reminder_task_list, :notice => 'Reminder task list was successfully created.') }
        format.xml  { render :xml => @reminder_task_list, :status => :created, :location => @reminder_task_list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reminder_task_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reminder_task_lists/1
  # PUT /reminder_task_lists/1.xml
  def update
    @reminder_task_list = ReminderTaskList.find(params[:id])

    respond_to do |format|
      if @reminder_task_list.update_attributes(params[:reminder_task_list])
        format.html { redirect_to(@reminder_task_list, :notice => 'Reminder task list was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reminder_task_list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reminder_task_lists/1
  # DELETE /reminder_task_lists/1.xml
  def destroy
    @reminder_task_list = ReminderTaskList.find(params[:id])
    @reminder_task_list.destroy

    respond_to do |format|
      format.html { redirect_to(reminder_task_lists_url) }
      format.xml  { head :ok }
    end
  end
end
