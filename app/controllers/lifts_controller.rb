class LiftsController < ApplicationController
  include ActionView::RecordIdentifier
  before_action :set_lift, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /lifts or /lifts.json
  def index
    @lifts = Lift.all
  end

  # GET /lifts/1 or /lifts/1.json
  def show
  end

  # GET /lifts/new
  def new
    @lift = current_user.lifts.build
  end

  # GET /lifts/1/edit
  def edit
  end

  # POST /lifts or /lifts.json
  def create
    @lift = current_user.lifts.build(lift_params)

    respond_to do |format|
      if @lift.save
        format.html { redirect_to lift_url(@lift), notice: "Lift was successfully created." }
        format.json { render :show, status: :created, location: @lift }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lifts/1 or /lifts/1.json
  def update
    respond_to do |format|
      if @lift.update(lift_params)
        format.html { redirect_to lift_url(@lift), notice: "Lift was successfully updated." }
        format.json { render :show, status: :ok, location: @lift }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lifts/1 or /lifts/1.json
  def destroy
    @lift.destroy!
    
    respond_to do |format|
      format.html { redirect_to lifts_url, notice: "Lift was successfully deleted." }
      format.json { head :no_content }
      format.turbo_stream { }
    end
  end

  def correct_user
    @lift = current_user.lifts.find_by(id: params[:id])
    redirect_to lifts_path, notice: "Not authorised to edit this lift" if @lift.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lift
      @lift = Lift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lift_params
      params.require(:lift).permit(:driver_name, :date, :time, :start_location, :destination, :cost, :contact_number, :user_id)
    end
end
