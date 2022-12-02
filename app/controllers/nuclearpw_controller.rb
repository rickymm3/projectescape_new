class NuclearpwController < ApplicationController

  def index
    render layout: "countdown"
  end

  def checkpw
    @fail = false
    if params['one'] != 0.to_s
      @fail = true
    elsif params['two'] != 4.to_s
      @fail = true
    elsif params['three'] != 1.to_s
      @fail = true
    elsif params['four'] != 0.to_s
      @fail = true
    elsif params['five'] != 1.to_s
      @fail = true
    elsif params['six'] != 8.to_s
      @fail = true
    end
    render layout: "countdown"

  end

end
