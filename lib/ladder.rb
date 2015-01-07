require 'starcraft'

module Starcraft

  class Ladder
    attr_reader :ladder_name, :ladder_id, :division, :rank, :league, :type, :wins, :losses, :showcase, :teams

    def initialize id
      download_ladder id
    end

    def download_ladder id
      data = JSON.parse(File.read("lib/#{id}.json"))
      # data = JSON.parse(HTTParty.get("https://us.api.battle.net/sc2/ladder/#{id}?locale=en_US&apikey=u6asyvg57kuru6gbsu37wxbmfd4djv9y").body)
      create_ladder data
    end

    def create_ladder data
      teams = []
      data['ladderMembers'].each do |member|
        profile = Starcraft::Profile.new
        profile.basic_data(member['character'])
        if teams.last && member['joinTimestamp'] == teams.last.timestamp
          teams.last.character.push(profile)
        else
          member['character'] = [profile]
          member['rank'] = teams.length + 1
          team = Starcraft::Team.new(member)
          teams << team
        end
      end
      @teams = teams
    end

  end

end
