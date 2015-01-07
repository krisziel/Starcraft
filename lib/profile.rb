require 'httparty'
require 'json'
require 'ladder'

module Starcraft

  class Profile
    attr_reader :name, :id, :realm, :display_name, :clan_name, :clan_tag, :profile_path, :portrait, :career, :season, :campaign, :swarm_levels, :rewards, :achievements, :ladders

    def initialize(name, id, realm)
      profile_data = File.read('profile.json')
      @name = name
      @id = id
      @realm = realm
      get_profile_data(JSON.parse(profile_data))
      # get_profile_data(JSON.parse(HTTParty.get("https://us.api.battle.net/sc2/profile/#{id}/#{realm}/#{name}/?locale=en_US&apikey=u6asyvg57kuru6gbsu37wxbmfd4djv9y").body))
    end

    def get_profile_data data
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
      @ladders = get_ladder_data(self)
    end

    def get_ladder_data profile
      data = JSON.parse(HTTParty.get("https://us.api.battle.net/sc2/profile/#{id}/#{realm}/#{name}/ladders?locale=en_US&apikey=u6asyvg57kuru6gbsu37wxbmfd4djv9y").body)
      Starcraft::Ladder.new(data)
    end

  end

end

# "id": 6117903,
# "realm": 1,
# "displayName": "lIBARCODEIl",
# "clanName": "BARCODE 4 LYFE",
# "clanTag": "lIllI",
# "profilePath": "/profile/6117903/1/lIBARCODEIl/",
# "portrait": {
#   "x": 0,
#   "y": 0,
#   "w": 90,
#   "h": 90,
#   "offset": 0,
#   "url": "http://media.blizzard.com/sc2/portraits/4-90.jpg"
# },
# "career":
