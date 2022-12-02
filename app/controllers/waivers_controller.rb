class WaiversController < ApplicationController
  before_action :set_waiver, only: [:show, :edit, :update, :destroy]

  # GET /waivers
  # GET /waivers.json
  def index
    @waivers = Waiver.where(:updated_at => (Time.now-2.hour)..Time.now).order( 'updated_at DESC' )
    if params[:pw] == "pe2016"
      @pwaccepted = true
    end

    respond_to do |format|
      format.html
      format.csv { send_data Waiver.all.to_csv }
    end
  end

  # GET /waivers/1
  # GET /waivers/1.json
  def show
  end

  # GET /waivers/new
  def new
    @waiver = Waiver.new
    @room = params[:room]
    render layout: "waiver"
  end

  # GET /waivers/1/edit
  def edit
  end

  # POST /waivers
  # POST /waivers.json
  def create
    @waiver = Waiver.new(waiver_params)

    respond_to do |format|
      if @waiver.save
        format.html { redirect_to new_waiver_path(room:waiver_params[:room]), notice: 'Waiver was successfully created.' }
        format.json { render :show, status: :created, location: @waiver }
      else
        format.html { render :new }
        format.json { render json: @waiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waivers/1
  # PATCH/PUT /waivers/1.json
  def update
    respond_to do |format|
      if @waiver.update(waiver_params)
        format.html { redirect_to @waiver, notice: 'Waiver was successfully updated.' }
        format.json { render :show, status: :ok, location: @waiver }
      else
        format.html { render :edit }
        format.json { render json: @waiver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waivers/1
  # DELETE /waivers/1.json
  def destroy
    @waiver.destroy
    respond_to do |format|
      format.html { redirect_to waivers_url, notice: 'Waiver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waiver
      @waiver = Waiver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waiver_params
      params.require(:waiver).permit(:name, :email, :room)
    end
end
