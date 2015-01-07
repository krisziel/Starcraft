require 'starcraft'

module Starcraft

  class Team
    attr_accessor :character, :timestamp, :points, :wins, :losses, :highest_rank, :previous_rank, :favorite_race

    def initialize
    end

    def self.basic_data data
      puts data
      @character = character
      @timestamp = data['joinTimestamp']
      @points = data['points']
      @wins = data['wins']
      @losses = data['losses']
      @highest_rank = data['highestRank']
      @previous_rank = data['previousRank']
      @favorite_race = data['favoriteRankP1']
    end

  end

end
