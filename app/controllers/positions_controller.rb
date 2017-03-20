class PositionsController < ApplicationController
  before_action :set_position, only: [:edit, :update, :destroy]
  before_action :set_vessel, only: [:index, :new, :create]

  def index
    @positions = @vessel.positions.order(open_date: :desc)
  end

  def new
    @position = @vessel.positions.build
  end

  def edit
  end

  def create
    @position = @vessel.positions.build(position_params)
    if @position.save
      redirect_to vessel_positions_path(@position.vessel), notice: 'Position was successfully created.'
    else
      render :new
    end
  end

  def update
    if @position.update(position_params)
      redirect_to vessel_positions_path(@position.vessel), notice: 'Position was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @position.destroy
    redirect_to vessel_positions_path(@position.vessel), notice: 'Position was successfully destroyed.'
  end

  private

  def set_vessel
    @vessel = Vessel.find(params[:vessel_id])
  end

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:port_id, :open_date)
  end
end
