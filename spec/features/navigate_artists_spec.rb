require 'rails_helper'

describe "Navigating artists" do
  let!(:user) { create :user }
  let!(:artist) { create :artist, first_name: "First Name 1", last_name: "Last Name 1" }

  it "allows navigation from the detail page to the listing page" do
    visit artist_url(artist)

    click_link "BACK"

    expect(current_path).to eq(artists_path)
  end

  it "allows navigation from the listing page to the detail page" do
    visit artists_url

    click_link "First Name 1"

    expect(current_path).to eq(artist_path(artist))
  end
end
