require 'rails_helper'

describe "Visitor viewing the list of artists" do
  let!(:artist1) { create :artist, first_name: "First Name 1", last_name: "Last Name 1", bio: "Bio 1"}
  let!(:artist2) { create :artist, first_name: "First Name 2", last_name: "Last Name 2", bio: "Bio 2"}

  it "shows all artists" do
    visit artists_url

    expect(page).to have_text("First Name 1")
    expect(page).to have_text("Last Name 1")
    expect(page).to have_text("First Name 2")
    expect(page).to have_text("Last Name 2")
  end

  it "does not show bio" do
    visit artists_url

    expect(page).not_to have_text("Bio 1")
    expect(page).not_to have_text("Bio 2")
  end
end
