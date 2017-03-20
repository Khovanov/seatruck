require 'rails_helper'

RSpec.describe Position, type: :model do
  describe 'associations for ...' do
    it { should belong_to :vessel }
    it { should belong_to :port }
  end

  describe 'validates presence of ...' do
    it { should validate_presence_of :vessel_id }
    it { should validate_presence_of :port_id }
    it { should validate_presence_of :open_date }
  end
end
