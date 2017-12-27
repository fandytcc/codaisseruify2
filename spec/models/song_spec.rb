require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe "association with artist" do
    it { is_expected.to belong_to :artist}
  end

end
