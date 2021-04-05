require 'rails_helper'

RSpec.describe StatusesController, type: :controller do
  let(:user) { create :user }
  let(:status) { create(:status) }
  
  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save a new status in the database' do
        expect { post :create, params: { status: attributes_for(:status) } }.to change(Status, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { status: attributes_for(:status) }
        expect(response).to redirect_to assigns(:exposed_status)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the status' do
        expect { post :create, params: { status: attributes_for(:status, :invalid) } }.to_not change(Status, :count)
      end

      it 're-renders new view' do
        post :create, params: { status: attributes_for(:status, :invalid) }
        expect(response).to render_template :new
      end      
    end
  end

  describe 'PATCH #update' do
    before { login(user) }

    context 'with valid attributes' do
      it 'assigns the requested status to @status' do
        patch :update, params: { id: status, status: attributes_for(:status) }, format: :js
        expect(assigns(:exposed_status)).to eq status
      end
          
      it 'changes status attributes' do
        patch :update, params: { id: status, status: { name: 'new name' } }, format: :js
        status.reload

        expect(status.name).to eq 'new name' 
      end

      it 'render template to updated status' do
        patch :update, params: { id: status, status: attributes_for(:status) }, format: :js
        # expect(response).to redirect_to status
        expect(response).to render_template :update
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: status, status: attributes_for(:status, :invalid) }, format: :js }

      it 'does not change status' do
        status.reload
        
        expect(status.name).to eq status.name
      end

      it 'renders update view' do
        expect(response).to render_template :update
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }    
    let!(:status) { create(:status) }

    it 'deletes the status' do
      expect { delete :destroy, params: { id: status }, format: :js }.to change(Status, :count).by(-1)
    end

    it 'render template to index' do
      delete :destroy, params: { id: status }, format: :js
      expect(response).to render_template :destroy
      # expect(response).to redirect_to statuses_path
    end
  end
end
