require 'rails_helper'

RSpec.describe Group, type: :model do  
  it { should belong_to(:country).optional }
  it { should belong_to(:group_status).optional }

  it { should have_many(:clients).dependent(:destroy) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :city }
  it { should validate_presence_of :email }
  it { should validate_presence_of :phon }
end
