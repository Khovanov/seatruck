require 'rails_helper'

RSpec.describe PortsController, type: :controller do

  let(:port) { create :port }

  describe 'GET #index' do
    let!(:ports) { create_list(:port, 2) }
    before { get :index }

    it 'populates an array of all ports' do
      expect(assigns(:ports)).to match_array(ports)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end


  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Port to @port' do
      expect(assigns(:port)).to be_a_new(Port)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      # for Rails 4
      get :edit, id: port
      # for Rails 5
      # get :edit, params: { id: port }
    end

    it 'assigns the requested Port to @port' do
      expect(assigns(:port)).to eq port
    end

    it 'renders edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    let(:subject) do
      post :create,
           port: attributes_for(:port)

    end
    let(:create_invalid_port) do
      post :create,
           port: attributes_for(:invalid_port)
    end

    context 'with valid attributes' do
      it 'saves new Port in the database' do
        expect { subject }.to change(Port, :count).by(1)
      end
      it 'redirect to Ports path' do
        subject
        expect(response).to redirect_to ports_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the Port' do
        expect { create_invalid_port }.to_not change(Port, :count)
      end

      it 're-renders new view' do
        create_invalid_port
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    let(:update_port_attr) do
      patch :update,
            id: port,
            port: attributes_for(:port)
    end
    let(:update_port_body) do
      patch :update,
            id: port,
            port: { title: 'Controller test title', lat: 10, lng: -10 }
    end

    context 'with valid attributes' do
      it 'assigns the requested Port to @port' do
        update_port_attr
        expect(assigns(:port)).to eq port
      end

      it 'change Port attributes' do
        update_port_body
        port.reload
        expect(port.title).to eq 'Controller test title'
        expect(port.lat).to eq 10
        expect(port.lng).to eq -10
      end

      it 'redirect to Ports path' do
        update_port_attr
        expect(response).to redirect_to ports_path
      end
    end

    context 'with invalid attributes' do
      before do
        patch :update,
              id: port,
              port: { title: nil, lat: nil, lng: nil }
      end

      it 'not change Port attributes' do
        port.reload
        expect(port.title).to_not eq nil
        expect(port.lat).to_not eq nil
        expect(port.lng).to_not eq nil
      end

      it 'render template update' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:destroy_port) do
      delete :destroy,
             id: port
    end
    before { port }

    it 'delete port' do
      expect { destroy_port }.to change(Port, :count).by(-1)
    end

    it 'redirect to Ports path' do
      destroy_port
      expect(response).to redirect_to ports_path
    end
  end
end
