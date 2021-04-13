require 'rails_helper'

RSpec.describe GroupPositionsController, type: :controller do
  let(:user) { create :user }
  let(:group_position) { create(:group_position) }
  
  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save a new GroupPosition in the database' do
        expect { post :create, params: { group_position: attributes_for(:group_position) } }.to change(GroupPosition, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { group_position: attributes_for(:group_position) }
        expect(response).to redirect_to assigns(:exposed_group_position)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the GroupPosition' do
        expect { post :create, params: { group_position: attributes_for(:group_position, :invalid) } }.to_not change(GroupPosition, :count)
      end

      it 're-renders new view' do
        post :create, params: { group_position: attributes_for(:group_position, :invalid) }
        expect(response).to render_template :new
      end      
    end
  end

  describe 'PATCH #update' do
    before { login(user) }

    context 'with valid attributes' do
      it 'assigns the requested group_position to @group_position' do
        patch :update, params: { id: group_position, group_position: attributes_for(:group_position) }, format: :js
        expect(assigns(:exposed_group_position)).to eq group_position
      end
          
      it 'changes group_position attributes' do
        patch :update, params: { id: group_position, group_position: { name: 'new name' } }, format: :js
        group_position.reload

        expect(group_position.name).to eq 'new name' 
      end

      it ' render template updated' do
        patch :update, params: { id: group_position, group_position: attributes_for(:group_position) }, format: :js
        expect(response).to render_template :update
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: group_position, group_position: attributes_for(:group_position, :invalid) }, format: :js }

      it 'does not change country' do
        group_position.reload
        
        expect(group_position.name).to eq group_position.name
      end

      it 'render template view' do
        expect(response).to render_template :update
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }    
    let!(:group_position) { create(:group_position) }

    it 'deletes the GroupPosition' do
      expect { delete :destroy, params: { id: group_position } }.to change(GroupPosition, :count).by(-1)
    end

    it 'redirect to index' do
      delete :destroy, params: { id: group_position }      
      expect(response).to redirect_to group_positions_path
    end
  end
end
