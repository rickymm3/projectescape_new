class HeistcountdownController < ApplicationController
  def index
    @heist = Timekeeper.where(room:"heist").first
    render layout: "countdown"
    @message = ""
  end
end
