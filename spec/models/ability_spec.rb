require 'rails_helper'
# require 'cancan/matchers'

describe Ability, type: :model do
  subject(:ability) { Ability.new(user) }

  describe 'for guest' do
    let(:user) { nil }

    it { should be_able_to :read, Client }    
    it { should_not be_able_to :manage, :all }
  end

  describe 'for admin' do
    let(:user) { create :user, admin: true }

    it { should be_able_to :manage, :all }
  end

  describe 'for user' do
    let(:user) { create :user }

    it { should_not be_able_to :manage, :all }
    it { should be_able_to :read, :all }

    it { should be_able_to :create, Client }
    it { should be_able_to :create, Status }
    it { should be_able_to :create, Group }
    it { should be_able_to :create, GroupStatus }
    it { should be_able_to :create, GroupPosition }
    it { should be_able_to :create, Project }
    it { should be_able_to :create, TeamPosition }

    it { should be_able_to :update, Client }
    it { should be_able_to :update, Status }
    it { should be_able_to :update, Group }
    it { should be_able_to :update, GroupStatus }
    it { should be_able_to :update, GroupPosition }
    it { should be_able_to :update, Project }
    it { should be_able_to :update, TeamPosition }
  end
end
