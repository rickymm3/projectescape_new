class Texthint2sController < ApplicationController
  before_action :set_texthint2, only: [:show, :edit, :update, :destroy]

  # GET /texthint2s
  # GET /texthint2s.json
  def index
    @texthint2s = Texthint2.all
  end

  # GET /texthint2s/1
  # GET /texthint2s/1.json
  def show
  end

  # GET /texthint2s/new
  def new
    @texthint2 = Texthint2.new
  end

  # GET /texthint2s/1/edit
  def edit
  end

  # POST /texthint2s
  # POST /texthint2s.json
  def create
    @texthint2 = Texthint2.new(texthint2_params)

    respond_to do |format|
      if @texthint2.save
        format.html { redirect_to @texthint2, notice: 'Texthint2 was successfully created.' }
        format.json { render :show, status: :created, location: @texthint2 }
      else
        format.html { render :new }
        format.json { render json: @texthint2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texthint2s/1
  # PATCH/PUT /texthint2s/1.json
  def update
    respond_to do |format|
      if @texthint2.update(texthint2_params)
        format.html { redirect_to @texthint2, notice: 'Texthint2 was successfully updated.' }
        format.json { render :show, status: :ok, location: @texthint2 }
      else
        format.html { render :edit }
        format.json { render json: @texthint2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texthint2s/1
  # DELETE /texthint2s/1.json
  def destroy
    @texthint2.destroy
    respond_to do |format|
      format.html { redirect_to texthint2s_url, notice: 'Texthint2 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_texthint2
      @texthint2 = Texthint2.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def texthint2_params
      params.require(:texthint2).permit(:message)
    end

end
