class WizardcountdownController < ApplicationController
  def index
    @wizard = Timekeeper.where(room:"wizard").first
    render layout: "countdown"
    @message = ""
  end
end