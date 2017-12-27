require 'rails_helper'

describe "Visitor adds song" do
  let!(:user) { create :user }
  let!(:artist) { create :artist }
  let!(:song1) { create :song, title: "Title1", artist: artist }

  it "with invalid input" do
    visit artist_url(artist)

    click_link "+ ADD NEW SONG"
    click_button "CREATE"

    expect(page).to have_content("Title can't be blank")
  end

end
