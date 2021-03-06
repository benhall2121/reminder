class RemindersMainsController < ApplicationController
  require 'apn_on_rails'

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
        format.html { redirect_to(reminders_mains_path(), :notice => 'Reminders main was successfully created.') }
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

  def get_reminders
    @reminders = RemindersMain.find(:all)

    if !@reminders.nil?
      render :json => @reminders.to_json(:include => [:reminderMessages])
    else          
      json_error_response(404, "Missing params")
    end
  end

  def add_reminder

    if params[:reminder_id].to_i > 0
      @reminders_main = RemindersMain.find(params[:reminder_id].to_i)
      @rmes = ReminderMessage.find(:first, :conditions => ['reminders_main_id = ?', @reminders_main.id])
      @rmes.update_attributes(:message => params[:messageComingIn])
    else
      @reminders_main = RemindersMain.new
      reminderMessages = @reminders_main.reminderMessages.build
      reminderMessages.message = params[:messageComingIn]
      @reminders_main.save
    end
    render :json => @reminders_main.to_json(:include => [:reminderMessages])
  end

  def delete_reminder

   # @reminder_id = ReminderMessage.find(:all, :conditions => ['message = ?', params[:messageToDeleteID]])

   # @reminder_id.each do |ri|
      @deleteMe = RemindersMain.find(params[:messageToDeleteID].to_i)
      @deleteMe.destroy
   # end

    render :nothing => true
  end

  def new_apn
  end

  def send_apn

    puts ''
    puts 'send_apn'
    puts 'params[:message]'
    puts params[:message]

    #THESE CONFIGURATIONS ARE DEFAULT, IF YOU WANT TO CHANGE UNCOMMENT LINES YOU WANT TO CHANGE   
    #configatron.apn.passphrase  = ''   
    #configatron.apn.port = 2195   
    #configatron.apn.host  = 'gateway.sandbox.push.apple.com'   
    #configatron.apn.cert = File.join(Rails.root, 'config', 'apple_push_notification_development.pem')    
    #THE CONFIGURATIONS BELOW ARE FOR PRODUCTION PUSH SERVICES, IF YOU WANT TO CHANGE UNCOMMENT LINES YOU WANT TO CHANGE   
    #configatron.apn.host = 'gateway.push.apple.com'   
    #configatron.apn.cert = File.join(RAILS_ROOT, 'config', 'apple_push_notification_production.pem')  

    device = APN::Device.find(:first)
    if device.nil?
      device = APN::Device.create(:token => "dab65bb5 bdc69fcb c293cd9e 3306f5b8 e508ed0e 2c14a4f5 3c26744b 24ab49b3")   
    end
    notification = APN::Notification.new   
    notification.device = device   
    notification.badge = 0   
    notification.sound = true   
    notification.alert = params[:message]   
    notification.save  

    system "rake apn:notifications:deliver"

    render :nothing => true
  end

end
