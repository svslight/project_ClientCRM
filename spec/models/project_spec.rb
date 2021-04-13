require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_many(:project_teams) }
  it { should have_many(:clients).through(:project_teams) }

  it { should validate_presence_of :name }
end
