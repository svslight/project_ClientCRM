require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  let(:user) { create :user }
  let(:role) { create(:role) }
  
  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save a new role in the database' do
        expect { post :create, params: { role: attributes_for(:role) } }.to change(Role, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { role: attributes_for(:role) }
        expect(response).to redirect_to assigns(:exposed_role)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the role' do
        expect { post :create, params: { role: attributes_for(:role, :invalid) } }.to_not change(Role, :count)
      end

      it 're-renders new view' do
        post :create, params: { role: attributes_for(:role, :invalid) }
        expect(response).to render_template :new
      end      
    end
  end

  describe 'PATCH #update' do
    before { login(user) }

    context 'with valid attributes' do
      it 'assigns the requested role to @role' do
        patch :update, params: { id: role, role: attributes_for(:role) }, format: :js
        expect(assigns(:exposed_role)).to eq role
      end
          
      it 'changes role attributes' do
        patch :update, params: { id: role, role: { name: 'new name' } }, format: :js
        role.reload

        expect(role.name).to eq 'new name' 
      end

      it 'render template to updated role' do
        patch :update, params: { id: role, role: attributes_for(:role) }, format: :js
        # expect(response).to redirect_to role
        expect(response).to render_template :update
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: role, status: attributes_for(:role, :invalid) }, format: :js }

      it 'does not change role' do
        role.reload
        
        expect(role.name).to eq role.name
      end

      it 'renders update view' do
        expect(response).to render_template :update
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }    
    let!(:role) { create(:role) }

    it 'deletes the role' do
      expect { delete :destroy, params: { id: role } }.to change(Role, :count).by(-1)
    end

    it 'render template to index' do
      delete :destroy, params: { id: role }
      # expect(response).to render_template :destroy
      expect(response).to redirect_to roles_path
    end
  end
end
