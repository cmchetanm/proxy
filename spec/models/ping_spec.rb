require 'rails_helper'

RSpec.describe Ping, type: :model do
  it { should validate_numericality_of(:app_id) }
  it { should validate_inclusion_of(:ping_type).in_array(['static', 'lite', 'dynamic']) }
end
