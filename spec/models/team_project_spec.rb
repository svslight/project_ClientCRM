require 'rails_helper'

RSpec.describe TeamProject, type: :model do
  it { should have_many(:clients).dependent(:destroy) }
end
