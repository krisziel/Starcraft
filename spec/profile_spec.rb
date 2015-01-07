require 'spec_helper'
require 'starcraft'

describe Starcraft do

  let(:profile){ Starcraft::Profile.new("lIBARCODEIl",6117903,1) }

  it "expects Starcraft to be a module" do
    expect(Starcraft.class).to eq(Module)
  end

  it "expects it to be of class Starcraft::Profile" do
    expect(profile.class).to eq(Starcraft::Profile)
  end

  it "expects instance variables name to exist in profile" do
    expect(profile.name).to eq("lIBARCODEIl")
    expect(profile.id).to eq(6117903)
    expect(profile.realm).to eq(1)
  end

  it "expects the displayName from the API to be correct" do
    expect(profile.display_name).to eq("lIBARCODEIl")
    expect(profile.clan_tag).to eq("lIllI")
  end

  it "expects career to have highest 1v1 rank as platinum" do
    expect(profile.career['highest1v1Rank']).to eq("PLATINUM")
  end

  it "expects profile ladder to current season" do
    profile.get_ladders
    expect(profile).to be(Ladder)
  end

  xit "expects the ladder to have a league and id" do
    expect(profile.ladders["currentSeason"][0].type).to be("FOURS")
    expect(profile.ladders["currentSeason"][0].id).to be(177930)
  end

  it "expects" do
  end

end
