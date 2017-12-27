require 'rails_helper'

describe "Visitor deletes a song" do
  let!(:user) { create :user }
  let!(:artist) { create :artist }
  let!(:song1) { create :song, title: "Title1", artist: artist }

  it "removes the song" do
    visit artist_url(artist)

    click_link "[Delete]"

    expect(page).not_to have_content("Title1")
  end

end
