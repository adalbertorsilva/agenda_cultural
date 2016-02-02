require 'rails_helper'


RSpec.feature "Contact", :type => :feature do

  scenario "Create a new contact" do

    visit "/events/new"



    fill_in "Title", with: "Event"

    fill_in "Description", with: "Description"

    fill_in "Place", with: "Place"

    fill_in "Address", with: "Address"

    fill_in "Beginning Date", with: "05/02/2016"

    fill_in "Ending Date", with: "08/02/2016"

    fill_in "Category", with: "Category"

    click_button "Create Event"

    expect(page).to have_content "error"

  end

end
