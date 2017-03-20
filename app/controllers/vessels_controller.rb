class VesselsController < ApplicationController
  before_action :set_vessel, only: [:edit, :update, :destroy]

  def index
    @vessels = Vessel.all
  end

  def new
    @vessel = Vessel.new
  end

  def edit
  end

  def create
    @vessel = Vessel.new(vessel_params)
    if @vessel.save
      redirect_to vessels_url, notice: 'Vessel was successfully created.'
    else
      render :new
    end
  end

  def update
    if @vessel.update(vessel_params)
      redirect_to vessels_url, notice: 'Vessel was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @vessel.destroy
    redirect_to vessels_url, notice: 'Vessel was successfully destroyed.'
  end

  private

  def set_vessel
    @vessel = Vessel.find(params[:id])
  end

  def vessel_params
    params.require(:vessel).permit(:title, :hold_capacity)
  end
end
