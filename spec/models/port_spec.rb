require 'rails_helper'

RSpec.describe Port, type: :model do
  describe 'associations for ...' do
    it { should have_many(:positions).dependent(:destroy) }
    it { should have_many(:cargos).dependent(:destroy) }
  end

  describe 'validates presence of ...' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :lat }
    it { should validate_presence_of :lng }
  end
end
