require_relative '../acceptance_helper'

feature 'Delete Port', %q(
  In order to cancel placed Port
  I want to be able to delete Port
) do

  given!(:port) { create :port }

  describe 'Any user' do
    scenario 'try to delete port', js: true do
      visit ports_path
      page.accept_confirm do
        click_on "Destroy"
      end
      expect(page).to_not have_content port.title
    end
  end
end
