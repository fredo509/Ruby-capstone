require_relative '../classes/game'

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
    puts "🚀 Listing games... 🎮"
    sleep(0.5)
    puts "\n======================================================================"
    puts ""
  
    if @game_ruby_objects.empty?
      puts "No games found."
    else
      @game_ruby_objects.each_with_index do |game, i|
        puts "[#{i}] ID: #{game[:id]} - Name: #{game[:name]} - Multiplayer: #{game[:multiplayer]} - Publish Date: #{game[:publish_date]} - Last Played At: #{game[:last_played_at]} - Archived: #{game[:archived]}"
      end
    end
  
    puts ""
  end

  def add_game
    puts ""
    puts "🚀 Adding a game... 🎮"
    sleep(0.5)
    puts "\n======================================================================"
    puts ""
    puts "What is the name of the game?"
    game_name = gets.chomp
    puts "Is it multiplayer? (true/false)"
    multiplayer = gets.chomp
    puts "What is the publish date? (YYYY-MM-DD)"
    publish_date = gets.chomp
    puts "What is the last played at? (YYYY-MM-DD)"
    last_played_at = gets.chomp
    @game_ruby_objects.push(to_ruby_object(Game.new(game_name, multiplayer, publish_date, last_played_at)))
    puts @game_ruby_objects
    puts ""
    puts "Game added! 😼 🕹️ "
    sleep(0.5)
    puts "\n======================================================================"
    puts ""
  end
end