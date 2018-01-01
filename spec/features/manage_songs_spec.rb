require 'rails_helper'

describe "Navigating artists" do
  let!(:artist) { create :artist }

  feature 'Manage songs', js: true do
    scenario 'add a new song' do
      visit artist_url(artist)
      fill_in 'song_title', with: 'Song100'
      page.execute_script("$('form').submit()")
      expect(page).to have_content('Song100')
    end

    scenario 'remove a song' do
      visit artist_url(artist)
      fill_in 'song_title', with: 'Song300'
      page.execute_script("$('form').submit()")

      check('song-1')
      click_link('delete')

      sleep(1)

      expect( page.find(:css, '.song success').text ).to eq "1"
      expect( page.find(:css, '.song success').text ).to eq "0"
    end

    scenario 'remove all songs' do
      visit artist_url(artist)
      all("input[type='checkbox']").each{|box| box.set('true')}
      click_link('delete')

      sleep(1)

      expect( page.to have_no_selector("input"))
    end
  end
end
