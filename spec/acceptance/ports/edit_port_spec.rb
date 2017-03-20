require_relative '../acceptance_helper'

feature 'Edit Port', %q(
  In order to fix Port
  I want to be able to edit Port
) do

  given(:port) { create :port }

  describe 'Any user' do
    describe 'try to edit Port' do
      before do
        port
        visit ports_path
        click_on "Edit"
      end

      scenario 'with valid params' do
        fill_in "Title", with: 'Fixed Port'
        fill_in "Lat", with: '100'
        fill_in "Lng", with: '-100'
        click_on "Update Port"
        
        expect(page).to have_content 'Fixed Port'
        expect(page).to have_content '100'
        expect(page).to have_content '-100'

        expect(page).to_not have_content port.title
        expect(page).to_not have_content port.lat
        expect(page).to_not have_content port.lng
      end

      scenario 'with invalid params' do
        fill_in "Title", with: nil
        fill_in "Lat", with: nil
        fill_in "Lng", with: nil
        click_on "Update Port"

        expect(page).to have_content "Title can't be blank"
        expect(page).to have_content "Lat can't be blank"
        expect(page).to have_content "Lng can't be blank"
      end
    end
  end
end
