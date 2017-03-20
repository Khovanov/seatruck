require 'rails_helper'

RSpec.describe Cargo, type: :model do
  describe 'associations for ...' do
    it { should belong_to :port }
  end

  describe 'validates presence of ...' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :port_id }
    it { should validate_presence_of :open_date }
    it { should validate_presence_of :capacity }
  end
end
