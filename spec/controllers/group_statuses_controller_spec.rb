require 'rails_helper'

RSpec.describe GroupStatusesController, type: :controller do
  let(:user) { create :user }
  let(:group_status) { create(:group_status) }
  
  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save a new GroupStatus in the database' do
        expect { post :create, params: { group_status: attributes_for(:group_status) } }.to change(GroupStatus, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { group_status: attributes_for(:group_status) }
        expect(response).to redirect_to assigns(:exposed_group_status)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the GroupStatus' do
        expect { post :create, params: { group_status: attributes_for(:group_status, :invalid) } }.to_not change(GroupStatus, :count)
      end

      it 're-renders new view' do
        post :create, params: { group_status: attributes_for(:group_status, :invalid) }
        expect(response).to render_template :new
      end      
    end
  end

  describe 'PATCH #update' do
    before { login(user) }

    context 'with valid attributes' do
      it 'assigns the requested group_status to @group_status' do
        patch :update, params: { id: group_status, group_status: attributes_for(:group_status) }, format: :js
        expect(assigns(:exposed_group_status)).to eq group_status
      end
          
      it 'changes group_status attributes' do
        patch :update, params: { id: group_status, group_status: { name: 'new name' } }, format: :js
        group_status.reload

        expect(group_status.name).to eq 'new name' 
      end

      it ' render template updated' do
        patch :update, params: { id: group_status, group_status: attributes_for(:group_status) }, format: :js
        expect(response).to render_template :update
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: group_status, group_status: attributes_for(:group_status, :invalid) }, format: :js }

      it 'does not change country' do
        group_status.reload
        
        expect(group_status.name).to eq group_status.name
      end

      it 'render template view' do
        expect(response).to render_template :update
       end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }    
    let!(:group_status) { create(:group_status) }

    it 'deletes the GroupStatus' do
      expect { delete :destroy, params: { id: group_status } }.to change(GroupStatus, :count).by(-1)
    end

    it 'redirect to index' do
      delete :destroy, params: { id: group_status }      
      expect(response).to redirect_to group_statuses_path
    end
  end
end
