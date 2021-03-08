require 'rails_helper'

RSpec.describe ClientStatusesController, type: :controller do

  let(:user) { create :user }
  let!(:client_status) { create(:client_status) }
  
  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save a new client_status in the database' do
        expect { post :create, params: { client_status: attributes_for(:client_status) } }.to change(ClientStatus, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { client_status: attributes_for(:client_status) }
        expect(response).to redirect_to assigns(:exposed_client_status)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the client_status' do
        expect { post :create, params: { client_status: attributes_for(:client_status, :invalid) } }.to_not change(ClientStatus, :count)
      end

      it 're-renders new view' do
        post :create, params: { client_status: attributes_for(:client_status, :invalid) }
        expect(response).to render_template :new
      end      
    end
  end

  describe 'PATCH #update' do
    before { login(user) }

    context 'with valid attributes' do
      it 'assigns the requested client_status to @client_status' do
        patch :update, params: { id: client_status, client_status: attributes_for(:client_status) }
        expect(assigns(:exposed_client_status)).to eq client_status
      end
          
      it 'changes client_status attributes' do
        patch :update, params: { id: client_status, client_status: { name: 'new name' } }
        client_status.reload

        expect(client_status.name).to eq 'new name' 
      end

      it 'redirects to updated client_status' do
        patch :update, params: { id: client_status, client_status: attributes_for(:client_status) }
        expect(response).to redirect_to client_status
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: client_status, client_status: attributes_for(:client_status, :invalid) } }

      it 'does not change client_status' do
        client_status.reload        

        expect(client_status.name).to eq client_status.name
      end

      it 'renders view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }    
    let!(:client_status) { create(:client_status) }

    it 'deletes the client_status' do
      expect { delete :destroy, params: { id: client_status } }.to change(ClientStatus, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: client_status }
      expect(response).to redirect_to client_statuses_path
    end
  end
end
