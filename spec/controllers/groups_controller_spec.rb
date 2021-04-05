require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:user) { create :user }
  let(:group) { create(:group) }
  
  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save a new GroupStatus in the database' do
        expect { post :create, params: { group: attributes_for(:group) } }.to change(Group, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { group: attributes_for(:group) }
        expect(response).to redirect_to assigns(:exposed_group)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the Group' do
        expect { post :create, params: { group: attributes_for(:group, :invalid) } }.to_not change(Group, :count)
      end

      it 're-renders new view' do
        post :create, params: { group: attributes_for(:group, :invalid) }
        expect(response).to render_template :new
      end      
    end
  end

  describe 'PATCH #update' do
    before { login(user) }

    context 'with valid attributes' do
      it 'assigns the requested group to @group' do
        patch :update, params: { id: group, group: attributes_for(:group) }, format: :js
        expect(assigns(:exposed_group)).to eq group
      end
          
      it 'changes group attributes' do
        patch :update, params: { id: group, group: { name: 'new name' } }, format: :js
        group.reload

        expect(group.name).to eq 'new name' 
      end

      it 'render template updated' do
        patch :update, params: { id: group, group: attributes_for(:group) }, format: :js
        expect(response).to render_template :update
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: group, group: attributes_for(:group, :invalid) }, format: :js }

      it 'does not change group' do
        group.reload
        
        expect(group.name).to eq group.name
      end

      it 'render template view' do
        expect(response).to render_template :update
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }    
    let!(:group) { create(:group) }

    it 'deletes the Group' do
      expect { delete :destroy, params: { id: group } }.to change(Group, :count).by(-1)
    end

    it 'redirect to index' do
      delete :destroy, params: { id: group }      
      expect(response).to redirect_to groups_path
    end
  end
end
