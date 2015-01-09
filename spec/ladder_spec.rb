require 'spec_helper'
require 'starcraft'

describe Starcraft do

  let(:ladder){ Starcraft::Ladder.new }

  it "expects a new ladder to be a Ladder" do
    expect(ladder.class).to eq(Starcraft::Ladder)
  end

  it "expects a new full ladder to have a team" do
    ladder.full_ladder(178045)
    expect(ladder.teams[0].class).to eq(Starcraft::Team)
  end

  it "expects a team to have three players" do
    ladder.full_ladder(178045)
    expect(ladder.teams[0].character.length).to eq(3)
  end

  it "expects a ladder team to have a profile" do
    ladder.full_ladder(178045)
    expect(ladder.teams[0].character[0].class).to be(Starcraft::Profile)
  end

  it "is able to create a full profile from a basic profile on a ladder" do
    ladder.full_ladder(178045)
    profile = Starcraft::Profile.new
    character = ladder.teams[0].character[0]
    profile.full_data(character.display_name,character.id,character.realm)
    expect(profile.display_name).to eq('KinkyOvi')
    expect(profile.career['league']).to eq('DIAMOND')
  end

end
