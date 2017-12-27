require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:bio).is_at_most(500) }
  end

  describe ".order_by_name" do
    let!(:artist1) { create :artist, first_name: "John" }
    let!(:artist2) { create :artist, first_name: "Alicia" }
    let!(:artist3) { create :artist, first_name: "Ed" }

    it "returns a sorted array of artists by first names" do
      expect(Artist.order_by_name).to eq([artist2, artist3, artist1])
    end
  end

  describe "association with song" do
    let(:artist) { create :artist }
    let!(:song) { create :song, artist: artist }

    it "has many songs" do
      song1 = artist.songs.new(title: "Title1")
      song2 = artist.songs.new(title: "Title2")

      expect(artist.songs).to include(song1)
      expect(artist.songs).to include(song2)
    end

    it "deletes associated songs" do
      expect { artist.destroy }.to change(Song, :count).by(-1)
    end
  end

end
