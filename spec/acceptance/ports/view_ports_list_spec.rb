require_relative '../acceptance_helper'

feature 'View Ports list', %q(
  The any user can view a list of Ports
) do

  given!(:ports) { create_list(:port, 3) }

  describe 'Any user' do
    scenario 'can view a list Ports' do
      visit ports_path
      ports.each do |port|
        expect(page).to have_content port.title
        expect(page).to have_content port.lat
        expect(page).to have_content port.lng
      end
    end
  end
end
