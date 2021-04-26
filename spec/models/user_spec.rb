require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:client).optional }

  it { should have_many(:role_users) }
  it { should have_many(:roles) }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
end
