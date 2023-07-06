require_relative '../classes/music_album'
require_relative '../classes/genre'

class MusicGenreOptions
    attr_accessor :music_albums, :genres
    
    def initialize
        @music_albums = []
        @genres = []
    end
    def add_music_album
      puts 'Enter your music name'
      name = gets.chomp
      puts 'Is the music on Spotify? (Y/N): '
      on_spotify = gets.chomp.downcase == 'y'
      puts 'Enter publish date (YYYY-MM-DD): '
      publish_date = gets.chomp

      music = Music.new(name, publish_date, on_spotify)
      add_genre(music)

      @music_albums << { name: music.name, publish_date: music.publish_date, on_spotify: music.on_spotify }
    end

    
    def add_genre(item)
        puts 'Enter genre name: '
        name = gets.chomp
        genre = Genre.new(name)
        genre.add_item(item)
        @genres << { name: genre.name}
        puts 'Genre added successfully!'
    end
 
    def list_all_music_albums
        all_music_album = @music_albums
        

        puts "\n======================================================================"
    puts "\n🔥 Listing music... 🖋️"
    sleep(0.5)
    puts ''
    if @music_albums.nil?
      puts "\n======================================================================"
      puts '||                                                                  ||'
      puts '||                        No music found 😿                       ||'
      puts '||                                                                  ||'
    else
      puts "I found #{@music_albums.length} Music:"
      puts ''
     all_music_album.each_with_index do |music_album, index|
        puts "#{index + 1}. Music name: #{music_album['name']}, Date published: #{music_album['publish_date']}, Is on spotify ?: #{music_album['on_spotify']}"
        end
      puts ''
    end
    puts '======================================================================'
    puts ''
    sleep(0.5)
    end

    def list_all_genres
        all_genres = @genres

         puts "\n======================================================================"
    puts "\n🔥 Listing genre... 🖋️"
    sleep(0.5)
    puts ''
    if @genres.empty?
      puts "\n======================================================================"
      puts '||                                                                  ||'
      puts '||                        No genre found 😿                       ||'
      puts '||                                                                  ||'
    else
      puts "I found #{@genres.length} Genre:"
      puts ''
      all_genres.each_with_index do |genre, index|
        puts "#{index + 1}. #{genre['name']}"
        end
      puts ''
    end
    puts '======================================================================'
    puts ''
    sleep(0.5)
    end

end