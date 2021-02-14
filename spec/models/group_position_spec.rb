require 'rails_helper'

RSpec.describe GroupPosition, type: :model do
  it { should have_many(:clients).dependent(:destroy) }
end
