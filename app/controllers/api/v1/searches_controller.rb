class Api::V1::SearchesController < Api::V1::BaseController
  DELTA_PERCENT = 10

  def cargos
    respond_with find_cargos
  end

  def positions
    respond_with find_positions 
  end

  private

  def find_cargos
    @position = Position.find(params[:position_id])
    @hold_capacity = @position.vessel.hold_capacity
    limit = @hold_capacity * (1.0 + DELTA_PERCENT / 100)
    @cargos = Cargo.where(port: @position.port, open_date: @position.open_date)
      .where("capacity <= ?", limit)
  end

  def find_positions
    @cargo = Cargo.find(params[:cargo_id])
    limit = @cargo.capacity * (1.0 - DELTA_PERCENT / 100)
    @positions = Position.joins(:vessel).where(port: @cargo.port, open_date: @cargo.open_date)
     .where("vessels.hold_capacity >= ?", limit)
  end
end
