class HeistController < ApplicationController

  def playfile
    @message = params[:message] if params[:message]
    Hint.where(:room => "heist").first.update_attributes(message:@message)
  end

  def clear_hint
    Hint.where(:room => "heist").first.update_attributes(message:"")
  end

  def update_text
    @message = Hint.where(:room => "heist").first.message
  end

  def custom_message
    Hint.where(:room => "heist").first.update_attributes(message:params[:message])
    render :nothing => true
  end

  def checkpw
    pw = params[:heistpw][:pw]
    if pw == "pe101"
      @pwaccepted = true
    else
      @pwaccepted = false
      @warning = true
    end
    redirect_to :controller => "heist", pwaccepted: @pwaccepted, warning: @warning
  end

  def index
    @texthints = Texthint.all
    @heist = Timekeeper.where(room:"heist").first
    render layout: "countdown"
  end

  def checkrunning
    heisttk = Timekeeper.where(room:"heist").first
    @heist = check_running(heisttk)
  end

  def starttimer
    tk = Timekeeper.where(room:params[:room]).first
    tk.start = Time.now
    tk.end = Time.now + 1.hour
    tk.pause = false
    tk.end = tk.start if params[:startstop] == "stop"
    tk.save
    @room = check_running(tk)
  end
end
