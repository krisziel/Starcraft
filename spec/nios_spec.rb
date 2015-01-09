require 'spec_helper'
require 'starcraft'

describe Starcraft do

  describe Starcraft::Nios do
    let(:clan){ Starcraft::Nios.new }
    before do
      clan.clan('xFTAx')
    end

    it "expects the clan to have a tag" do
      expect(clan.tag).to eq('xFTAx')
    end

    it "is able to process a profile url" do
      expect(clan.parse_player('http://us.battle.net/sc2/en/profile/6196405/1/Killjoy')).to eq({:id=>'6196405',:realm=>'1',:name=>'Killjoy'})
    end

    xit "expects the clan to have a name" do
      clan.get_data
      expect(clan.name).to eq('Fire Team Alpha')
    end

    it "expects the clan to have a list of players" do
      clan.get_data
      expect(clan.members.length).to eq(4)
    end

    it "expects the players to be profiles" do
      clan.get_data
      clan.get_profiles
      expect(clan.members[0].class).to eq(Starcraft::Profile)
    end

    it "expects the players to have full data" do
      clan.get_data
      clan.get_profiles
      expect(clan.members[0].display_name).to eq('Killjoy')
    end

  end

end
