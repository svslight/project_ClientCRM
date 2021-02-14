require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should have_many(:clients).dependent(:destroy) }
  it { should belong_to(:country) }
  it { should belong_to(:group_status) }
end
