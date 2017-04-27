require "rails_helper"

RSpec.feature "Feedback Form", type: :feature do

  scenario "User creates a new form" do
    visit "/"

    fill_in "Name", with: 'Denis Popov'
    fill_in "Age", with: 25
    click_button "Create Form"

    expected_text = 'Your request with ID 1 has been sent! We are waiting for you on'
    expect(page).to have_text(expected_text)
  end

  scenario "User should not create a new form without name" do
    visit "/"

    fill_in "Age", with: 25
    click_button "Create Form"

    expect(page).to have_text("can't be blank")
  end

  scenario "User should not create a new form without age" do
    visit "/"

    fill_in "Name", with: 'Denis Popov'
    click_button "Create Form"

    expect(page).to have_text("can't be blank")
  end

  scenario "User should not create a new form with name "\
    "that concists of one world" do
    visit "/"

    fill_in "Name", with: 'Denis'
    fill_in "Age", with: 25
    click_button "Create Form"

    expect(page).to have_text("Name should contain 2 words with large letter")
  end

  scenario "User should not create a new form with age "\
    "less than 17" do
    visit "/"

    fill_in "Name", with: 'Denis Popov'
    fill_in "Age", with: 16
    click_button "Create Form"

    expect(page).to have_text("Age should be from 17 to 65")
  end

  scenario "User should not create a new form with Previous Feedback ID "\
    "that is not saved in database" do
    visit "/"

    fill_in "Name", with: 'Denis Popov'
    fill_in "Age", with: 17
    fill_in "Previous Feedback ID", with: 1
    click_button "Create Form"

    expect(page).to have_text("Previous Feedback IDcan't find form with 1 ID")
  end
end