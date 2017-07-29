class DriveDataController < ApplicationController
  before_action :set_drive_datum, only: [:show, :edit, :update, :destroy]

  # GET /drive_data
  # GET /drive_data.json
  def index
    @drive_data = DriveDatum.all
  end

  # GET /drive_data/1
  # GET /drive_data/1.json
  def show
  end

  # GET /drive_data/new
  def new
    @drive_datum = DriveDatum.new
  end

  # GET /drive_data/1/edit
  def edit
  end

  # POST /drive_data
  # POST /drive_data.json
  def create
    @drive_datum = DriveDatum.new(drive_datum_params)

    respond_to do |format|
      if @drive_datum.save
        format.html { redirect_to @drive_datum, notice: 'Drive datum was successfully created.' }
        format.json { render :show, status: :created, location: @drive_datum }
      else
        format.html { render :new }
        format.json { render json: @drive_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drive_data/1
  # PATCH/PUT /drive_data/1.json
  def update
    respond_to do |format|
      if @drive_datum.update(drive_datum_params)
        format.html { redirect_to @drive_datum, notice: 'Drive datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @drive_datum }
      else
        format.html { render :edit }
        format.json { render json: @drive_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drive_data/1
  # DELETE /drive_data/1.json
  def destroy
    @drive_datum.destroy
    respond_to do |format|
      format.html { redirect_to drive_data_url, notice: 'Drive datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drive_datum
      @drive_datum = DriveDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drive_datum_params
      params.require(:drive_datum).permit(:user_id, :stats, :start_time, :end_time, :start_loc, :end_loc)
    end
end
