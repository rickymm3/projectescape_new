class WizardController < ApplicationController

  def index
    @texthint2s = Texthint2.all
    @wizard = Timekeeper.where(room:"wizard").first
    @countdown = @wizard.end - Time.now
    render layout: "countdown"
    @nowrite = false
    @room = "Project escape"

  end

  def playfile
    @message = params[:message] if params[:message]
    Hint.where(:room => "wizard").first.update_attributes(message:@message)
  end

  def clear_hint
    Hint.where(:room => "wizard").first.update_attributes(message:"")
  end

  def update_text
    @message = Hint.where(:room => "wizard").first.message
  end

  def checkpw
    pw = params[:wizardpw][:pw]
    if pw == "pe101"
      @pwaccepted = true
      @text = ""
    else
      @pwaccepted = false
      @text = "If you are not accessing this from Project Escape location, your IP has been logged and sent to the police.  Expect to be prosecuted to the fullest extent of the law. IP: #{request.remote_ip}"
    end
    redirect_to :controller => "wizard", pwaccepted: @pwaccepted
  end

  def custom_message
    Hint.where(:room => "wizard").first.update_attributes(message:params[:message])
    render :nothing => true
  end

  def checkrunning
    wizardtk = Timekeeper.where(room:"wizard").first
    @wizard = check_running(wizardtk)
    @countdown = @wizard.end - Time.now
  end

  def starttimer
    tk = Timekeeper.where(room:params[:room]).first
    tk.start = Time.now
    tk.pause = false
    tk.end = Time.now + 1.hour
    tk.end = tk.start if params[:startstop] == "stop"
    tk.save
    @room = check_running(tk)
  end

  def custom_file

  end

end
