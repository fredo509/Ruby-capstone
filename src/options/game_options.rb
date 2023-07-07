require_relative '../classes/game'
require_relative 'author_options'
require_relative 'label_options'

class GameOptions
  attr_accessor :game_instances, :game_ruby_objects

  def initialize
    @game_instances = []
    @game_ruby_objects = []
  end

  def to_ruby_object(game)
    {
      'id' => game.id,
      'name' => game.game_name,
      'multiplayer' => game.multiplayer,
      'publish_date' => game.publish_date,
      'last_played_at' => game.last_played_at,
      'archived' => game.archived,
      'author' => {
        'first_name' => game.author.first_name,
        'last_name' => game.author.last_name
      },
      'label' => {
        'title' => game.label.title,
        'color' => game.label.color
      },
      'genre' => {
        'name' => game.genre.name
      }
    }
  end

  def list_games
    puts "\n======================================================================".colorize(:light_red)
    puts "\n🚀 Listing games... 🎮".colorize(:light_white)
    puts ''
    sleep(0.5)
    if @game_ruby_objects.empty?
      puts "\n======================================================================".colorize(:light_red)
      puts '||                                                                  ||'.colorize(:light_red)
      puts '||                         No games found 😿                        ||'.colorize(:light_white)
      puts '||                                                                  ||'.colorize(:light_red)
      puts '======================================================================'.colorize(:light_red)
    else
      @game_ruby_objects.each_with_index do |game, i|
        puts "[#{i}]".colorize(:light_red) + " / Name: #{game['name']} / Multiplayer: #{game['multiplayer']} / Publish Date: #{game['publish_date']} /
    Last Played At: #{game['last_played_at']} /".colorize(:light_white)
      end
      puts "\n======================================================================".colorize(:light_red)
    end
    puts ''
  end

  def add_game(author_options, label_options, genre_options)
    puts ''
    puts '🚀 Adding a game... 🎮'.colorize(:light_white)
    sleep(0.5)
    puts "\n======================================================================".colorize(:light_red)
    puts ''
    puts 'What is the name of the game?'.colorize(:light_white)
    game_name = gets.chomp
    puts 'Is it multiplayer? (true/false)'.colorize(:light_white)
    multiplayer = gets.chomp
    puts 'What is the publish date? (YYYY-MM-DD)'.colorize(:light_white)
    publish_date = gets.chomp
    puts 'What is the last played at? (YYYY-MM-DD)'.colorize(:light_white)
    last_played_at = gets.chomp
    new_game = Game.new(game_name, multiplayer, publish_date, last_played_at)
    genre_options.add_genre(new_game)
    author_options.add_author(new_game)
    label_options.add_label(new_game)
    @game_ruby_objects.push(to_ruby_object(new_game))
    sleep(0.3)

    puts "\n======================================================================".colorize(:light_red)
    puts '||                                                                  ||'.colorize(:light_red)
    puts '||                          😺 Label added! 📕                     ||'.colorize(:light_white)
    puts '||                          😺 Author added! 📕                     ||'.colorize(:light_white)
    sleep(0.3)
    puts '||                          🕹️ Game was added! 😼                    ||'.colorize(:light_white)
    puts '||                                                                  ||'.colorize(:light_red)
    puts '======================================================================'.colorize(:light_red)
    puts ''
  end
end
