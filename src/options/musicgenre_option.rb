require_relative '../classes/music_album'
require_relative '../classes/genre'

class MusicGenreOptions
    attr_reader :music_albums, :genres
    
    def initialize
        @music_albums = []
        @genres = []
    end

    def add_music_album
        puts 'Is the music on spotify? (Y/N): '
        on_spotify = gets.chomp.downcase == 'y'
        puts 'Enter publish date (YYYY-MM-DD): '
        publish_date = gets.chomp

        music = Music.new(publish_date, on_spotify)
        add_genre(music)
        @music_albums << music
    end
    
    def add_genre(item)
        puts 'Enter genre name: '
        name = gets.chomp

        genre = Genre.new(name)
        genre.add_item(item)
        @genres << genre
        puts 'Genre added successfully!'
    end
 
    def list_all_music_albums
        all_music_album = @music_albums
        all_music_album.each_with_index do |music_album, index|
        puts "#{index + 1}. #{music_album.publish_date}, #{music_album.on_spotify}"
        end
    end

    def list_all_genres
        all_genres = @genres
        all_genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre.name}"
        end
    end

end