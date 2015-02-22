require 'spec_helper'
require 'starcraft'

describe Starcraft do

  let(:profile){ Starcraft::Profile.new }
  before do
    profile.full_data("lIBARCODEIl",6117903,1)
  end

  it "expects Starcraft to be a module" do
    expect(Starcraft.class).to eq(Module)
  end

  it "expects it to be of class Starcraft::Profile" do
    expect(profile.class).to eq(Starcraft::Profile)
  end

  it "expects instance variables name to exist in profile" do
    expect(profile.display_name).to eq("lIBARCODEIl")
    expect(profile.id).to eq(6117903)
    expect(profile.realm).to eq(1)
  end

  it "expects the clan tag to be correct" do
    expect(profile.clan_tag).to eq("5CaRy")
  end

  it "expects career to have highest 1v1 rank as platinum" do
    expect(profile.career['highest1v1Rank']).to eq("PLATINUM")
  end

  it "expects profile to have ladder" do
    profile.basic_ladder_data
    expect(profile.ladders[0].class).to be(Starcraft::Ladder)
  end

  it "expects the ladder to have a league and id" do
    profile.basic_ladder_data
    expect(profile.ladders[0].mmq).to eq("FOURS")
    expect(profile.ladders[0].id).to eq(181271)
  end

  it "expects the player to have five leagues" do
    profile.basic_ladder_data
    expect(profile.ladders.length).to eq(15)
  end

end
