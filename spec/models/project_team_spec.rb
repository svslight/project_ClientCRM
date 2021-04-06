require 'rails_helper'

RSpec.describe ProjectTeam, type: :model do
  it { should belong_to(:project) }
  it { should belong_to(:client) }
end
