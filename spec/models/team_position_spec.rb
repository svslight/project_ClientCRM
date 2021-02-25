require 'rails_helper'

RSpec.describe TeamPosition, type: :model do
  it { should have_many(:clients).dependent(:destroy) }
end
