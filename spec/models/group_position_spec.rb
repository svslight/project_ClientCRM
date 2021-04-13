require 'rails_helper'

RSpec.describe GroupPosition, type: :model do
  it { should have_many(:clients).dependent(:destroy) }

  it { should validate_presence_of :name }
end
