require 'rails_helper'

RSpec.describe Country, type: :model do
  it { should have_many(:clients).dependent(:destroy) }
  it { should have_many(:groups).dependent(:destroy) }

  it { should validate_presence_of :name }
end
