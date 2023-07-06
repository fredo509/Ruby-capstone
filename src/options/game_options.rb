require_relative '../classes/game'
require_relative 'author_options'

class GameOptions
  attr_accessor :game_instances, :game_ruby_objects

  def initialize
    @game_instances = []
    @game_ruby_objects = []
  end

  def to_ruby_object(game)
    {
      id: game.id,
      name: game.game_name,
      multiplayer: game.multiplayer,
      publish_date: game.publish_date,
      last_played_at: game.last_played_at,
      archived: game.archived
    }
  end

  def list_games
    puts "\n======================================================================"
    puts "\n🚀 Listing games... 🎮"
    puts ''
    sleep(0.5)
    if @game_ruby_objects.empty?
      puts "\n======================================================================"
      puts '||                                                                  ||'
      puts '||                         No games found 😿                        ||'
      puts '||                                                                  ||'
      puts '======================================================================'
    else
      @game_ruby_objects.each_with_index do |game, i|
        puts "[#{i}] ID: #{game[:id]} - Name: #{game[:name]} - Multiplayer: #{game[:multiplayer]} - Publish Date: #{game[:publish_date]} -
        Last Played At: #{game[:last_played_at]} - Archived: #{game[:archived]}"
      end
      puts "\n======================================================================"
    end
    puts ''
  end

  def add_game(author_options)
    puts ''
    puts '🚀 Adding a game... 🎮'
    sleep(0.5)
    puts "\n======================================================================"
    puts ''
    puts 'What is the name of the game?'
    game_name = gets.chomp
    puts 'Is it multiplayer? (true/false)'
    multiplayer = gets.chomp
    puts 'What is the publish date? (YYYY-MM-DD)'
    publish_date = gets.chomp
    puts 'What is the last played at? (YYYY-MM-DD)'
    last_played_at = gets.chomp
    new_game = Game.new(game_name, multiplayer, publish_date, last_played_at)
    @game_ruby_objects.push(to_ruby_object(new_game))
    author_options.add_author(new_game)
    sleep(0.3)
    puts "\n======================================================================"
    puts '||                                                                  ||'
    puts '||                          😺 Author added! 📕                     ||'
    sleep(0.3)
    puts '||                          🕹️ Game was added! 😼                    ||'
    puts '||                                                                  ||'
    puts '======================================================================'
    puts ''
  end
end
