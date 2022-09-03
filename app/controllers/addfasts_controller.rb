class AddfastsController < ApplicationController
  before_action :set_addfast, only: %i[show edit update destroy]
  before_action :authenticate_account!
  before_action :correct_account, only: [:show, :edit, :update, :destroy]

  

 
  # GET /addfasts or /addfasts.json
  def index
    @addfasts = Addfast.all
  end

  # GET /addfasts/1 or /addfasts/1.json
  def show
  end

  # GET /addfasts/new
  def new

    # @addfast = Addfast.new
    @addfast = current_account.addfasts.build(addfast_params)
  end

  # GET /addfasts/1/edit
  def edit
  end

  # POST /addfasts or /addfasts.json
  def create
      @addfast = current_account.addfasts.build(addfast_params)
    respond_to do |format|
      if @addfast.save
        format.html { redirect_to addfast_url(@addfast), notice: "Addfast was successfully created." }
        format.json { render :show, status: :created, location: @addfast }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @addfast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addfasts/1 or /addfasts/1.json
  def update
    respond_to do |format|
      if @addfast.update(addfast_params)
        format.html { redirect_to addfast_url(@addfast), notice: "Addfast was successfully updated." }
        format.json { render :show, status: :ok, location: @addfast }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @addfast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addfasts/1 or /addfasts/1.json
  def destroy
    @addfast.destroy

    respond_to do |format|
      format.html { redirect_to addfasts_url, notice: "Addfast was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_account
    @addfast = current_account.addfasts.find_by(id: params[:id])
    redirect_to addfasts_path, notice: "Not Authorized" if @addfast.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addfast
      @addfast = Addfast.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def addfast_params
      params.fetch(:addfast, {}).permit(:Name, :DateAndTime, :account_id, :activity_level, :height, :weight, :unit_conversion)
    end
end
