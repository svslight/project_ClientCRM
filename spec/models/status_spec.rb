require 'rails_helper'

RSpec.describe Status, type: :model do
  it { should have_many(:status_clients) }
  it { should have_many(:clients).through(:status_clients) }

  it { should validate_presence_of :name }
end
