class TexthintsController < ApplicationController
  before_action :set_texthint, only: [:show, :edit, :update, :destroy]

  # GET /texthints
  # GET /texthints.json
  def index
    @texthints = Texthint.all
  end

  # GET /texthints/1
  # GET /texthints/1.json
  def show
  end

  # GET /texthints/new
  def new
    @texthint = Texthint.new
  end

  # GET /texthints/1/edit
  def edit
  end

  # POST /texthints
  # POST /texthints.json
  def create
    @texthint = Texthint.new(texthint_params)

    respond_to do |format|
      if @texthint.save
        format.html { redirect_to @texthint, notice: 'Texthint was successfully created.' }
        format.json { render :show, status: :created, location: @texthint }
      else
        format.html { render :new }
        format.json { render json: @texthint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texthints/1
  # PATCH/PUT /texthints/1.json
  def update
    respond_to do |format|
      if @texthint.update(texthint_params)
        format.html { redirect_to @texthint, notice: 'Texthint was successfully updated.' }
        format.json { render :show, status: :ok, location: @texthint }
      else
        format.html { render :edit }
        format.json { render json: @texthint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texthints/1
  # DELETE /texthints/1.json
  def destroy
    @texthint.destroy
    respond_to do |format|
      format.html { redirect_to texthints_url, notice: 'Texthint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_texthint
      @texthint = Texthint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def texthint_params
      params.require(:texthint).permit(:message)
    end
end
