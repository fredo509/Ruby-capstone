require_relative '../classes/music_album'
require_relative './genre_options'
require_relative './author_options'

class MusicOptions
  attr_accessor :music_instances, :music_ruby_objects

  def initialize
    @music_instances = []
    @music_ruby_objects = []
  end

  def to_ruby_object(music)
    {
      'id' => music.id,
      'on_spotify' => music.on_spotify,
      'publish_date' => music.publish_date,
      'archived' => music.archived,
      'author' => {
        'first_name' => music.author.first_name,
        'last_name' => music.author.last_name
      },
      'label' => {
        'title' => music.label.title,
        'color' => music.label.color
      },
      'genre' => {
        'name' => music.genre.name
      }
    }
  end

  def list_musics
    puts "\n♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪".colorize(:light_red)
    puts "\n🚀 Listing musics... ♫".colorize(:light_white)
    puts ''
    sleep(0.5)
    if @music_ruby_objects.empty?
      puts "\n♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪".colorize(:light_red)
      puts '||                                                                  ||'.colorize(:light_red)
      puts '||                         No musics found 😿                        ||'.colorize(:light_white)
      puts '||                                                                  ||'.colorize(:light_red)
      puts '♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪'.colorize(:light_red)
    else
      @music_ruby_objects.each_with_index do |music, i|
        id = music['id']
        on_spotify = music['on_spotify']
        name = music['name']
        publish_date = music['publish_date']

        puts "[ ♪ #{i}]".colorize(:light_red) + " ID: #{id} - Music name: #{name} - Is on spotify ? : #{on_spotify}
        - Publish Date: #{publish_date}".colorize(:light_white)
      end
      puts "\n♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪".colorize(:light_red)
    end
    puts ''
  end

  def add_music(genre_options, author_options, label_options)
    puts ''
    puts '🚀 Adding a music...  ♫'.colorize(:light_white)
    sleep(0.5)
    puts "\n♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪♪
    ".colorize(:light_red)
    puts ''
    puts 'What is the name of the music?'.colorize(:light_white)
    music_name = gets.chomp
    puts 'What is the publish date? (YYYY-MM-DD)'.colorize(:light_white)
    publish_date = gets.chomp
    puts 'Is the music on Spotify? (Y/N): '.colorize(:light_white)
    on_spotify = gets.chomp.downcase == 'y'
    new_music = Music.new(music_name, publish_date, on_spotify)
    genre_options.add_genre(new_music)
    author_options.add_author(new_music)
    label_options.add_label(new_music)
    @music_ruby_objects.push(to_ruby_object(new_music))
    sleep(0.3)
    puts "\n======================================================================".colorize(:light_red)
    puts '||                                                                  ||'.colorize(:light_red)
    puts '||                          😺 Author added! 📕                     ||'.colorize(:light_white)
    puts '||                          😺 genre added! 📕                      ||'.colorize(:light_white)
    sleep(0.3)
    puts '||                          ♫ music was added! 😼                    ||'.colorize(:light_white)
    puts '||                                                                  ||'.colorize(:light_red)
    puts '======================================================================'.colorize(:light_red)
    puts ''
  end
end
