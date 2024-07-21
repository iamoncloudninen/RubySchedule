class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]

  # GET /schedules or /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1 or /schedules/1.json
  def show
    @schedule = Schedule.find(params[:id])
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules or /schedules.json
  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :startDate, :endDate, :allDay, :scheduleMemo))
      if @schedule.save
        flash[:notice] = "予定を新規追加しました"
        redirect_to :schedules
       else
        flash[:alert] = "予定の新規追加に失敗しました"
        render "new"  
      end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    @user = Schedule.find(params[:id])
      if @schedule.update(params.require(:schedule).permit(:title, :startDate, :endDate, :allDay, :scheduleMemo))
        flash[:notice] = "予定を更新しました"
        redirect_to :schedules
       else
        flash[:alert] = "予定の更新に失敗しました"
        render "edit"
       end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule = Schedule.find(params[:id])
     @schedule.destroy
     flash[:notice] = "予定を削除しました"
     redirect_to :schedules
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:title, :startDate, :endDate, :allDay, :scheduleMemo)
    end
end
