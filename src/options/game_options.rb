class GameOptions
  def initialize
    @game_instances = []
    @game_ruby_objects = [
      {
        id: 42,
        name: 'Silent hill',
        multiplayer: false,
        publish_date: '1999-01-31',
        last_played_at: '2020-02-02',
        archived: false
      },
      {
        id: 43,
        name: 'Silent hill V',
        multiplayer: false,
        publish_date: '1999-01-31',
        last_played_at: '2020-02-02',
        archived: false
      }
    ]
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
    puts ""
    puts "🚀 Listing games... 🎮"
    sleep(0.5)
    puts "\n======================================================================"
    puts ""
    @game_ruby_objects.each_with_index do |game, i|
      puts "[#{i}] ID: #{game[:id]} - Name: #{game[:name]} - Multiplayer: #{game[:multiplayer]} - Publish Date: #{game[:publish_date]} - Last Played At: #{game[:last_played_at]} - Archived: #{game[:archived]}"
    end
    puts ""
  end
end