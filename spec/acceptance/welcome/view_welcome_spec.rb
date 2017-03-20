require_relative '../acceptance_helper'

feature 'View Welcome page', %q(
  The any user can view a Welcome page
) do

  describe 'Any user' do
    scenario 'can view a welcome page' do
      visit root_path
      expect(page).to have_content "Welcome to SeaTruck application"
      expect(page).to have_link "Ports"
      expect(page).to have_link "Cargos"
      expect(page).to have_link "Vessels"
    end
  end
end
