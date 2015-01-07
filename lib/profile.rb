require 'starcraft'

module Starcraft

  class Profile
    attr_reader :name, :id, :realm, :display_name, :clan_name, :clan_tag, :profile_path, :portrait, :career, :season, :campaign, :swarm_levels, :rewards, :achievements, :ladders

    def initialize(name, id, realm)
      profile_data = File.read('lib/profile.json')
      @name = name
      @id = id
      @realm = realm
      get_profile_data(JSON.parse(profile_data))
      # get_profile_data(JSON.parse(HTTParty.get("https://us.api.battle.net/sc2/profile/#{id}/#{realm}/#{name}/?locale=en_US&apikey=u6asyvg57kuru6gbsu37wxbmfd4djv9y").body))
    end

    def self.basic_data data
      @id = data['id']
      @display_name = data['displayName']
      @name = data['displayName']
      @realm = data['realm']
      @clan_name = data['clanName']
      @clan_tag = data['clanTag']
      @profile_path = data['profilePath']
    end

    def get_profile_data(name, id, realm)
      data = JSON.parse(profile_data)
      # data = JSON.parse(HTTParty.get("https://us.api.battle.net/sc2/profile/#{id}/#{realm}/#{name}/?locale=en_US&apikey=u6asyvg57kuru6gbsu37wxbmfd4djv9y").body)
      @display_name = data['displayName']
      @clan_name = data['clanName']
      @clan_tag = data['clanTag']
      @profile_path = data['profilePath']
      @portrait = data['portrait']
      @career = data['career']
      @season = data['season']
      @campaign = data['campaign']
      @swarm_levels = data['swarmLevels']
      @rewards = data['rewards']
      @achievements = data['achievements']
      @ladders = nil
    end

    def get_ladders
      @ladders = get_ladder_data(@name, @id, @realm)
    end

    def get_ladder_data name, id, realm
      data = JSON.parse(File.read('lib/ladderlist.json'))
      # data = JSON.parse(HTTParty.get("https://us.api.battle.net/sc2/profile/#{id}/#{realm}/#{name}/ladders?locale=en_US&apikey=u6asyvg57kuru6gbsu37wxbmfd4djv9y").body)
      ladders = []
      data['currentSeason'].each do |ladder_type|
        ladder_type.each do |ladder|
          ladder[1].each do |this_ladder|
            ladders.push(Starcraft::Ladder.new(this_ladder['ladderId'])) if ladder[0] == "ladder" && ladder[1].length > 0
          end
        end
      end
    end

  end

end
