module Starcraft

  class Ladder
    attr_reader :ladder_name, :ladder_id, :division, :rank, :league, :type, :wins, :losses, :showcase

    def initialize data
      p data
      # check_ladder_type(data)
    end

    def check_ladder_type data

    end

    def create_ladder data
      @ladder_name = data['ladderName']
      @ladder_id = data['ladderId']
      @division = data['division']
      @rank = data['rank']
      @league = data['league']
      @type = data['matchMakingQueue']
      @wins = data['wins']
      @losses = data['losses']
      @showcase = data['showcase']
      @characters = []
      data['characters'].each do |character|
        @character << Profile.new(character['displayName'], character['id'], character['realm'])
      end
    end

  end

end

# "ladderName": "Pylon Nu",
# "ladderId": 179011,
# "division": 11,
# "rank": 80,
# "league": "PLATINUM",
# "matchMakingQueue": "SOLO",
# "wins": 2,
# "losses": 3,
# "showcase": true

# {
#   "ladder": [{
#     "ladderName": "Warp Prism Omega",
#     "ladderId": 178045,
#     "division": 1,
#     "rank": 98,
#     "league": "DIAMOND",
#     "matchMakingQueue": "THREES",
#     "wins": 5,
#     "losses": 0,
#     "showcase": false
#     }],
#     "characters": [{
#       "id": 1985621,
#       "realm": 1,
#       "displayName": "Black",
#       "clanName": "",
#       "clanTag": "",
#       "profilePath": "/profile/1985621/1/Black/"
#       }, {
#         "id": 6030221,
#         "realm": 1,
#         "displayName": "Cruelty",
#         "clanName": "Scary Sea",
#         "clanTag": "5CaRy",
#         "profilePath": "/profile/6030221/1/Cruelty/"
#         }, {
#           "id": 6117903,
#           "realm": 1,
#           "displayName": "lIBARCODEIl",
#           "clanName": "BARCODE 4 LYFE",
#           "clanTag": "lIllI",
#           "profilePath": "/profile/6117903/1/lIBARCODEIl/"
#           }],
#           "nonRanked": []
#         }
