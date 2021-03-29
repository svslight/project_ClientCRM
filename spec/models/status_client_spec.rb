require 'rails_helper'

RSpec.describe StatusClient, type: :model do
  it { should belong_to(:status) }
  it { should belong_to(:client) }
end
