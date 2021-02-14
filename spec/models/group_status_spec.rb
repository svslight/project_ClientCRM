require 'rails_helper'

RSpec.describe GroupStatus, type: :model do
  it { should have_many(:groups).dependent(:destroy) }
end
