require 'rails_helper'

describe 'Searches API' do
  describe 'GET /cargo' do

    context 'success' do
      let(:date_now) { Time.zone.now }
      let(:port) { create(:port) }
      let(:vessel) { create(:vessel, hold_capacity: 1000) }
      let!(:cargos) { create_list(:cargo, 2, port: port, capacity: 1000, open_date: date_now) }
      let(:cargo) { cargos.first }
      let!(:position) { create(:position, vessel: vessel, port: port, open_date: date_now) }

      before { do_request position_id: position.id }

      it 'returns 201 status code' do
        expect(response).to be_success
      end

      it 'returns list of Cargos' do
        expect(response.body).to have_json_size(2).at_path("/")
      end

      context 'Cargo' do
        it 'contains Cargo' do
          # cargo_serializer = CargoSerializer.new(cargo, adapter: :json)
          cargo_serializer = CargoSerializer.new(cargo)
          expect(response.body).to be_json_eql(cargo_serializer.to_json).at_path("0/")
        end

        it 'Cargo object have size 5' do
          expect(response.body).to have_json_size(5).at_path("0/")
        end

        %w(id title open_date capacity).each do |attr|
          it "contains attribute: #{attr}" do
            expect(response.body).to be_json_eql(cargo.send(attr.to_sym).to_json).at_path("0/#{attr}")
          end
        end
      end

      context 'Port' do
        it 'Port object have size 4' do
          expect(response.body).to have_json_size(4).at_path("0/port")
        end

        %w(id title lat lng).each do |attr|
          it "contains attribute: #{attr}" do
            expect(response.body).to be_json_eql(port.send(attr.to_sym).to_json).at_path("0/port/#{attr}")
          end
        end
      end

    end

    def do_request(options = {})
      get '/api/v1/searches/cargos', { format: :json }.merge(options)
    end
  end


  describe 'GET /position' do

    context 'success' do
      let(:date_now) { Time.zone.now }
      let(:port) { create(:port) }
      let(:vessel) { create(:vessel, hold_capacity: 1000) }
      let!(:cargo) { create(:cargo, port: port, capacity: 1000, open_date: date_now) }
      let!(:positions) { create_list(:position, 2, vessel: vessel, port: port, open_date: date_now) }
      let(:position) { positions.first }

      before { do_request cargo_id: cargo.id }

      it 'returns 201 status code' do
        expect(response).to be_success
      end

      it 'returns list of Positions' do
        expect(response.body).to have_json_size(2).at_path("/")
      end

      context 'Position' do
        it 'contains Position' do
          position_serializer = PositionSerializer.new(position)
          expect(response.body).to be_json_eql(position_serializer.to_json).at_path("0/")
        end

        it 'Position object have size 4' do
          expect(response.body).to have_json_size(4).at_path("0/")
        end

        %w(id open_date).each do |attr|
          it "contains attribute: #{attr}" do
            expect(response.body).to be_json_eql(position.send(attr.to_sym).to_json).at_path("0/#{attr}")
          end
        end
      end

      context 'Port' do
        it 'Port object have size 4' do
          expect(response.body).to have_json_size(4).at_path("0/port")
        end

        %w(id title lat lng).each do |attr|
          it "contains attribute: #{attr}" do
            expect(response.body).to be_json_eql(port.send(attr.to_sym).to_json).at_path("0/port/#{attr}")
          end
        end
      end

      context 'Vessel' do
        it 'Vessel object have size 3' do
          expect(response.body).to have_json_size(3).at_path("0/vessel")
        end

        %w(id title hold_capacity).each do |attr|
          it "contains attribute: #{attr}" do
            expect(response.body).to be_json_eql(vessel.send(attr.to_sym).to_json).at_path("0/vessel/#{attr}")
          end
        end
      end
    end

    def do_request(options = {})
      get '/api/v1/searches/positions', { format: :json }.merge(options)
    end
  end
end
