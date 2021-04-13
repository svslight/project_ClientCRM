require 'rails_helper'

RSpec.describe TeamPositionsController, type: :controller do
  let(:user) { create :user }
  let(:team_position) { create(:team_position) }
  
  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save a new TeamPosition in the database' do
        expect { post :create, params: { team_position: attributes_for(:team_position) } }.to change(TeamPosition, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { team_position: attributes_for(:team_position) }
        expect(response).to redirect_to assigns(:exposed_team_position)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the TeamPosition' do
        expect { post :create, params: { team_position: attributes_for(:team_position, :invalid) } }.to_not change(TeamPosition, :count)
      end

      it 're-renders new view' do
        post :create, params: { team_position: attributes_for(:team_position, :invalid) }
        expect(response).to render_template :new
      end      
    end
  end

  describe 'PATCH #update' do
    before { login(user) }

    context 'with valid attributes' do
      it 'assigns the requested team_position to @team_position' do
        patch :update, params: { id: team_position, team_position: attributes_for(:team_position) }, format: :js
        expect(assigns(:exposed_team_position)).to eq team_position
      end
          
      it 'changes team_position attributes' do
        patch :update, params: { id: team_position, team_position: { name: 'new name' } }, format: :js
        team_position.reload

        expect(team_position.name).to eq 'new name' 
      end

      it ' render template updated' do
        patch :update, params: { id: team_position, team_position: attributes_for(:team_position) }, format: :js
        expect(response).to render_template :update
        # expect(response).to redirect_to team_position
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: team_position, team_position: attributes_for(:team_position, :invalid) }, format: :js }

      it 'does not change country' do
        team_position.reload
        
        expect(team_position.name).to eq team_position.name
      end

      it 'render template view' do
        expect(response).to render_template :update
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }    
    let!(:team_position) { create(:team_position) }

    it 'deletes the TeamPosition' do
      expect { delete :destroy, params: { id: team_position } }.to change(TeamPosition, :count).by(-1)
    end

    it 'redirect to index' do
      delete :destroy, params: { id: team_position }      
      expect(response).to redirect_to team_positions_path
    end
  end
end
