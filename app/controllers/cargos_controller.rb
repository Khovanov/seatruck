class CargosController < ApplicationController
  before_action :set_cargo, only: [:edit, :update, :destroy]

  def index
    @cargos = Cargo.all
  end

  def new
    @cargo = Cargo.new
  end

  def edit
  end

  def create
    @cargo = Cargo.new(cargo_params)
    if @cargo.save
      redirect_to cargos_url, notice: 'Cargo was successfully created.'
    else
      render :new
    end
  end

  def update
    if @cargo.update(cargo_params)
      redirect_to cargos_url, notice: 'Cargo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cargo.destroy
    redirect_to cargos_url, notice: 'Cargo was successfully destroyed.'
  end

  private

  def set_cargo
    @cargo = Cargo.find(params[:id])
  end

  def cargo_params
    params.require(:cargo).permit(:title, :port_id, :open_date, :capacity)
  end
end
