require 'rails_helper'

describe "Viewing an individual artist" do
  let!(:artist) { create :artist }

  let!(:song1) { create :song, title: "Title1", artist: artist }
  let!(:song2) { create :song, title: "Title2", artist: artist }

  it "shows the artist's details" do
    visit artist_url(artist)

    expect(page).to have_text(artist.first_name)
    expect(page).to have_text(artist.last_name)
    expect(page).to have_text(artist.bio)
    expect(page).to have_text("Title1")
    expect(page).to have_text("Title2")
  end
end
