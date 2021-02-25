require 'rails_helper'

RSpec.describe ClientStatus, type: :model do
  it { should have_many(:clients).dependent(:destroy) }
end
