require 'rails_helper'

RSpec.describe Vessel, type: :model do
  describe 'associations for ...' do
    it { should have_many(:positions).dependent(:destroy) }
  end

  describe 'validates presence of ...' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :hold_capacity }
  end
end
