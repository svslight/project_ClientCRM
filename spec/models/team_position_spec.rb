require 'rails_helper'

RSpec.describe TeamPosition, type: :model do
  it { should have_many(:clients).dependent(:destroy) }

  it { should validate_presence_of :name }
end
