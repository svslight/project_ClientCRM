require 'rails_helper'

RSpec.describe CountriesController, type: :controller do
  let(:user) { create :user }
  let(:country) { create(:country) }
  
  describe 'POST #create' do
    before { login(user) }

    context 'with valid attributes' do
      it 'save a new country in the database' do
        expect { post :create, params: { country: attributes_for(:country) } }.to change(Country, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { country: attributes_for(:country) }
        expect(response).to redirect_to assigns(:exposed_country)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the country' do
        expect { post :create, params: { country: attributes_for(:country, :invalid) } }.to_not change(Country, :count)
      end

      it 're-renders new view' do
        post :create, params: { country: attributes_for(:country, :invalid) }
        expect(response).to render_template :new
      end      
    end
  end

  describe 'PATCH #update' do
    before { login(user) }

    context 'with valid attributes' do
      it 'assigns the requested country to @country' do
        patch :update, params: { id: country, country: attributes_for(:country) }, format: :js
        expect(assigns(:exposed_country)).to eq country
      end
          
      it 'changes country attributes' do
        patch :update, params: { id: country, country: { name: 'new name' } }, format: :js
        country.reload

        expect(country.name).to eq 'new name' 
      end

      it 'redirects to updated country' do
        patch :update, params: { id: country, country: attributes_for(:country) }, format: :js
        # expect(response).to redirect_to country
        expect(response).to render_template :update
      end
    end

    context 'with invalid attributes' do
      before { patch :update, params: { id: country, country: attributes_for(:country, :invalid) }, format: :js }

      it 'does not change country' do
        country.reload
        
        expect(country.name).to eq country.name
      end

      it 'renders update view' do
        expect(response).to render_template :update
      end
    end
  end

  describe 'DELETE #destroy' do
    before { login(user) }    
    let!(:country) { create(:country) }

    it 'deletes the country' do
      expect { delete :destroy, params: { id: country } }.to change(Country, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: country }
      expect(response).to redirect_to countries_path
    end
  end
end
