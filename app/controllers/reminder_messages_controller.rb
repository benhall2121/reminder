class ReminderMessagesController < ApplicationController
  # GET /reminder_messages
  # GET /reminder_messages.xml
  def index
    @reminder_messages = ReminderMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reminder_messages }
    end
  end

  # GET /reminder_messages/1
  # GET /reminder_messages/1.xml
  def show
    @reminder_message = ReminderMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reminder_message }
    end
  end

  # GET /reminder_messages/new
  # GET /reminder_messages/new.xml
  def new
    @reminder_message = ReminderMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reminder_message }
    end
  end

  # GET /reminder_messages/1/edit
  def edit
    @reminder_message = ReminderMessage.find(params[:id])
  end

  # POST /reminder_messages
  # POST /reminder_messages.xml
  def create
    @reminder_message = ReminderMessage.new(params[:reminder_message])

    respond_to do |format|
      if @reminder_message.save
        format.html { redirect_to(@reminder_message, :notice => 'Reminder message was successfully created.') }
        format.xml  { render :xml => @reminder_message, :status => :created, :location => @reminder_message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reminder_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reminder_messages/1
  # PUT /reminder_messages/1.xml
  def update
    @reminder_message = ReminderMessage.find(params[:id])

    respond_to do |format|
      if @reminder_message.update_attributes(params[:reminder_message])
        format.html { redirect_to(@reminder_message, :notice => 'Reminder message was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reminder_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reminder_messages/1
  # DELETE /reminder_messages/1.xml
  def destroy
    @reminder_message = ReminderMessage.find(params[:id])
    @reminder_message.destroy

    respond_to do |format|
      format.html { redirect_to(reminder_messages_url) }
      format.xml  { head :ok }
    end
  end
end
