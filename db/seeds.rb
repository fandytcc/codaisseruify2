# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Photo.destroy_all
Song.destroy_all
Artist.destroy_all
User.destroy_all

user = User.create!(email: "test@test.com", password: "123456")

#artists
artist_1 = Artist.create!(first_name: "John", last_name: "Legend", bio: "Grammy and Academy Award-winning singer-songwriter John Legend is known for such acclaimed albums as Get Lifted and Love in the Future.")

artist_2 = Artist.create!(first_name: "Lady", last_name: "Gaga", bio: "Pop icon Lady Gaga\'s debut album, The Fame, included the hits Just Dance and Poker Face. Her follow-up effort, The Fame Monster, was nominated for six Grammys.")

artist_3 = Artist.create!(first_name: "Alicia", last_name: "Key", bio: "Alicia Keys is a multiple Grammy Award-winning singer-songwriter whose debut album, Songs in A Minor, went platinum five times over.")

artist_4 = Artist.create!(first_name: "Gavin", last_name: "James", bio: "Singer and songwriter who is known for his 2012 debut EP, Say Hello. The title track subsequently won the Song of the Year award from Ireland\'s Meteor Choice Music Prize.")

artist_5 = Artist.create!(first_name: "Taylor", last_name: "Swift", bio: "Grammy Award-winning singer/songwriter Taylor Swift made a splash in the country music world in 2006 and has gone on to become one of the top acts in popular music.")

artist_6 = Artist.create!(first_name: "Justin", last_name: "Bieber", bio: "Justin Bieber is a Grammy Award-winning Canadian pop star who was discovered via YouTube. His latest hits include Let Me Love You, Despacito (Remix), and I am the One.")

artist_7 = Artist.create!(first_name: "Bruno", last_name: "Mars", bio: "Bruno Mars is Grammy-winning singer/songwriter known for such hit songs as Nothin on You, Just the Way You Are, Locked Out of Heaven and ptown Funk.")

artist_8 = Artist.create!(first_name: "Beyonce", last_name: "Knowles", bio: "Beyoncé Knowles is a multi-platinum, Grammy Award-winning recording artist who's acclaimed for her thrilling vocals, videos and live shows.")

artist_9 = Artist.create!(first_name: "Adele", last_name: "Laruie", bio: "Singer Adele is a Grammy Award-winning artist whose throwback, soulful sound has made her an international success with hits like Rolling in the Deep, Someone Like You and Hello.")

artist_10 = Artist.create!(first_name: "Ed", last_name: "Sheeran", bio: "U.K. artist Ed Sheeran is a Grammy-winning singer/songwriter known for hit songs like Thinking Out Loud and Photograph.")

artists = [artist_1, artist_2, artist_3, artist_4, artist_5, artist_6, artist_7, artist_8, artist_9, artist_10]
# 10.times do
#   artists << Artist.create!(
#       first_name: Faker::Name.first_name,
#       last_name: Faker::Name.last_name,
#       bio: Faker::Hipster.paragraph[0..496] << "...",
#   )
# end

#songs
songs = []
artists.sample(10).each do |artist|
    songs << 10.times do Song.create!(
      title: Faker::Lorem.words(3).join(' '),
      artist: artist,
    )
  end
end

# photos
photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dp99fz03x/image/upload/v1514279984/john-legend_tud4rr.jpg", artist: artist_1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dp99fz03x/image/upload/v1514305574/lady-gaga_bxcrvg.jpg", artist: artist_2)
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dp99fz03x/image/upload/v1514279724/po63w2ye8k_rmnk5c.jpg", artist: artist_3 )

photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dp99fz03x/image/upload/v1514279625/Gavin-James_urhae9.jpg", artist: artist_4 )
photo5 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dp99fz03x/image/upload/v1514279578/6ff5c34fae327b11f8b23a80b721de86_jakfdi.jpg", artist: artist_5)
photo6 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dp99fz03x/image/upload/v1514279560/justin-bieber-tumblr-wallpapers-desktop-13976182_xlkzj7.jpg", artist: artist_6 )

photo7 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dp99fz03x/image/upload/v1514279548/Top-10-Most-Popular-Hollywood-Singer-in-2015-Bruno-Mars_wnzp3m.jpg", artist: artist_7)
photo8 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dp99fz03x/image/upload/v1514279494/21b02479f5f3f3e982ae4f05c3e2fbab-1200-80_smtq82.jpg", artist: artist_8)
photo9 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dp99fz03x/image/upload/v1514279426/adele-1_qak3yc.jpg", artist: artist_9)
photo10 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dp99fz03x/image/upload/v1514279388/ed-sheeran-net-worth_ubmflt.jpg", artist: artist_10)
