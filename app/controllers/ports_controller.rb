class PortsController < ApplicationController
  before_action :set_port, only: [:edit, :update, :destroy]

  def index
    @ports = Port.all
  end

  def new
    @port = Port.new
  end

  def edit
  end

  def create
    @port = Port.new(port_params)
    if @port.save
      redirect_to ports_url, notice: 'Port was successfully created.'
    else
      render :new
    end
  end

  def update
    if @port.update(port_params)
      redirect_to ports_url, notice: 'Port was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @port.destroy
    redirect_to ports_url, notice: 'Port was successfully destroyed.'
  end

  private

  def set_port
    @port = Port.find(params[:id])
  end

  def port_params
    params.require(:port).permit(:title, :lat, :lng)
  end
end
