class RemindersMainsController < ApplicationController
  # GET /reminders_mains
  # GET /reminders_mains.xml
  def index
    @reminders_mains = RemindersMain.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reminders_mains }
    end
  end

  # GET /reminders_mains/1
  # GET /reminders_mains/1.xml
  def show
    @reminders_main = RemindersMain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reminders_main }
    end
  end

  # GET /reminders_mains/new
  # GET /reminders_mains/new.xml
  def new
    @reminders_main = RemindersMain.new

    reminderMessages = @reminders_main.reminderMessages.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reminders_main }
    end
  end

  # GET /reminders_mains/1/edit
  def edit
    @reminders_main = RemindersMain.find(params[:id])
  end

  # POST /reminders_mains
  # POST /reminders_mains.xml
  def create
    @reminders_main = RemindersMain.new(params[:reminders_main])

    respond_to do |format|
      if @reminders_main.save
        format.html { redirect_to(@reminders_main, :notice => 'Reminders main was successfully created.') }
        format.xml  { render :xml => @reminders_main, :status => :created, :location => @reminders_main }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @reminders_main.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reminders_mains/1
  # PUT /reminders_mains/1.xml
  def update
    @reminders_main = RemindersMain.find(params[:id])

    respond_to do |format|
      if @reminders_main.update_attributes(params[:reminders_main])
        format.html { redirect_to(@reminders_main, :notice => 'Reminders main was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reminders_main.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders_mains/1
  # DELETE /reminders_mains/1.xml
  def destroy
    @reminders_main = RemindersMain.find(params[:id])
    @reminders_main.destroy

    respond_to do |format|
      format.html { redirect_to(reminders_mains_url) }
      format.xml  { head :ok }
    end
  end
end
