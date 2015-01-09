module Starcraft

  class SC2Ranks
    attr_accessor :tag, :name

    def initialize tag
      @tag = tag
      # response = RestClient.get("http://api.sc2ranks.com/v2/clans/1/%5B#{tag}%5D",{'api_key' => 'iJLevaB2qdqB52HP51TUlaFMbz1VVwsLBBKP'})
    end



  end

end
