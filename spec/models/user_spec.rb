require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:client).optional }

  it { should have_many(:role_users) }
  it { should have_many(:roles) }

  it { should validate_presence_of :email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  describe 'update' do
    let!(:user) { create(:user) }
    let!(:role) { create(:role) }
    let!(:role_user) { create( :role_user, user: user, role: role) }

    it 'role_user' do
      expect(user).to eq user
      expect(role_user).to eq role_user
    end
  end
end
