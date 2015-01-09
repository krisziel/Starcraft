require 'spec_helper'
require 'starcraft'

describe Starcraft do

  let(:clan){ Starcraft::Clan.new('xFTAx') }

  it "create a clan" do
    expect(clan.class).to be(Starcraft::Clan)
  end

  it "Clan object has proper data" do
    expect(clan.tag).to eq("xFTAx")
  end

  xit "" do
  end

end
