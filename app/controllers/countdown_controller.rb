class CountdownController < ApplicationController
  def index
    @heist = Timekeeper.where(room:"heist").first
    @wizard = Timekeeper.where(room:"wizard").first
    @nuclear = Timekeeper.where(room:"nuclear").first

  end

  def checkrunning
    if params[:room] == "heist"
      heisttk = Timekeeper.where(room:"heist").first
      @heist = check_running(heisttk)
    elsif params[:room] == "wizard"
      wizardtk = Timekeeper.where(room:"wizard").first
      @wizard = check_running(wizardtk)
    elsif params[:room] == "nuclear"
      nucleartk = Timekeeper.where(room:"nuclear").first
      @nuclear = check_running(nucleartk)
    end
  end

  def starttimer
    tk = Timekeeper.where(room:params[:room]).first
    tk.start = Time.now
    tk.end = Time.now + 1.hour
    tk.end = tk.start if params[:stoptimer] == "stop"
    tk.save
    @room = check_running(tk)
    if tk.room == "wizard"
      @pwaccepted = true
      redirect_to wizard_index_path(pwaccepted: @pwaccepted)
    elsif tk.room == "heist"
      @pwaccepted = true
      redirect_to heist_index_path(pwaccepted: @pwaccepted)
    else
      @pwaccepted = true
      redirect_to nuclear_index_path(pwaccepted: @pwaccepted)
    end
  end

  def addtime
    tk = Timekeeper.where(id:params[:tk]).first
    time = params[:astime].to_i
    tk.end = tk.end + time.minute
    tk.save
    if tk.room == "wizard"
      redirect_to wizard_index_path
    elsif tk.room == "heist"
      redirect_to heist_index_path
    else
      redirect_to nuclear_index_path
    end
  end

  def pause
    tk = Timekeeper.where(room:params[:room]).first
    tk.pause = !tk.pause
    tk.save
  end
end