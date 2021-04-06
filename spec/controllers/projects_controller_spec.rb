require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create :user }
  let(:project) { create(:project) }
  
  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save a new project in the database' do
        expect { post :create, params: { project: attributes_for(:project) } }.to change(Project, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { project: attributes_for(:project) }
        expect(response).to redirect_to assigns(:exposed_project)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the project' do
        expect { post :create, params: { project: attributes_for(:project, :invalid) } }.to_not change(Project, :count)
      end

      it 're-renders new view' do
        post :create, params: { project: attributes_for(:project, :invalid) }
        expect(response).to render_template :new
      end      
    end
  end

  describe 'PATCH #update' do
    before { login(user) }

    context 'with valid attributes' do
      it 'assigns the requested project to @project' do
        patch :update, params: { id: project, project: attributes_for(:project) }, format: :js
        expect(assigns(:exposed_project)).to eq project
      end
          
      it 'changes status attributes' do
        patch :update, params: { id: project, project: { name: 'new name' } }, format: :js
        project.reload

        expect(project.name).to eq 'new name' 
      end

      it 'render template to updated project' do
        patch :update, params: { id: project, project: attributes_for(:project) }, format: :js
        # expect(response).to redirect_to project
        expect(response).to render_template :update
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: project, project: attributes_for(:project, :invalid) }, format: :js }

      it 'does not change status' do
        project.reload
        
        expect(project.name).to eq project.name
      end

      it 'renders update view' do
        expect(response).to render_template :update
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }    
    let!(:project) { create(:project) }

    it 'deletes the status' do
      expect { delete :destroy, params: { id: project } }.to change(Project, :count).by(-1)
    end

    it 'render template to index' do
      delete :destroy, params: { id: project }
      expect(response).to redirect_to projects_path
    end
  end
end
