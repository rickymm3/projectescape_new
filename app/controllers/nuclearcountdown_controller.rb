class NuclearcountdownController < ApplicationController
  def index
    @nuclear = Timekeeper.where(room:"nuclear").first
    render layout: "countdown"
    @message = ""
  end
end