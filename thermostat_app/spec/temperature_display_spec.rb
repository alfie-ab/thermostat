require 'spec_helper'

feature "temperature display" do

  scenario "displays the correct page" do
    visit '/'
    expect(page).to have_content("Thermostat")
  end
end
