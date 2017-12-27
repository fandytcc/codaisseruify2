require 'rails_helper'

describe "Visitor deletes an artist" do
  let!(:user) { create :user }
  let!(:artist) { create :artist, first_name: "First Name 1", last_name: "Last Name 1" }
  let!(:song1) { create :song, title: "Title1", artist: artist }

  it "removes the artist" do
    visit artist_url(artist)

    click_link "DELETE ARTIST"

    expect(page).not_to have_content("First Name 1")
    expect(page).not_to have_content("Last Name 1")
    expect(page).not_to have_content("Title1")
  end

end
