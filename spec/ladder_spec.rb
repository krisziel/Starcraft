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

  xit "expects a basic ladder to exist" do
  end

end
