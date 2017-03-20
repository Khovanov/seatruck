require_relative '../acceptance_helper'

feature 'Create Port', %q(
  In order to place cargos and vessels position
  I want to be able to create port
) do

  describe 'Any user' do
    before do
      visit ports_path
    end

    scenario 'try create valid Port' do
      click_on "New Port"
      fill_in "Title", with: 'New Port'
      fill_in "Lat", with: '52.13333333'
      fill_in "Lng", with: '-10.26666667'
      click_on "Create Port"
      expect(page).to have_content 'New Port'
      expect(page).to have_content '52.13333333'
      expect(page).to have_content '-10.26666667'
    end

    scenario 'try create invalid Port' do
      click_on "New Port"
      fill_in "Title", with: nil
      fill_in "Lat", with: nil
      fill_in "Lng", with: nil
      click_on "Create Port"
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Lat can't be blank"
      expect(page).to have_content "Lng can't be blank"
    end
  end
end
