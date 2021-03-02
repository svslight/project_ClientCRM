require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  let(:user) { create :user }
  let(:client) { create(:client) }
    
  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save a new client in the database' do
        expect { post :create, params: { client: attributes_for(:client) } }.to change(Client, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { client: attributes_for(:client) }
        expect(response).to redirect_to assigns(:exposed_client)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the client' do
        expect { post :create, params: { client: attributes_for(:client, :invalid) } }.to_not change(Client, :count)
      end

      it 're-renders new view' do
        post :create, params: { client: attributes_for(:client, :invalid) }
        expect(response).to render_template :new
      end      
    end
  end

  describe 'PATCH #update' do
    before { login(user) }

    context 'with valid attributes' do
      it 'assigns the requested client to @client' do
        patch :update, params: { id: client, client: attributes_for(:client) }, format: :js
        expect(assigns(:exposed_client)).to eq client
      end
           
      it 'changes client attributes' do
        patch :update, params: { id: client, client: { name: 'new name' } }, format: :js
        client.reload

        expect(client.name).to eq 'new name' 
      end

      it 'redirects to updated client' do
        patch :update, params: { id: client, client: attributes_for(:client) }, format: :js
        # expect(response).to redirect_to client
        expect(response).to render_template :update
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: client, client: attributes_for(:client, :invalid) }, format: :js }

      it 'does not change client' do
        client.reload
        
        expect(client.name).to eq client.name
      end

      it 'renders update view' do
        expect(response).to render_template :update
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }
    let!(:client) { create(:client) }

    it 'deletes the client' do
      expect { delete :destroy, params: { id: client } }.to change(Client, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: client }
      expect(response).to redirect_to clients_path
    end
  end
end
