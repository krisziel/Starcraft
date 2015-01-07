require 'spec_helper'
require 'starcraft'

describe Starcraft do

  let(:ladder){ Starcraft::Ladder.new(178045) }

  it "expects a new ladder to be a Ladder" do
    expect(ladder.class).to eq(Starcraft::Ladder)
  end

  it "expects a new ladder to have a team" do
    expect(ladder.teams[0].class).to eq(Starcraft::Team)
  end

  it "expects a team to have three players" do
    expect(ladder.teams[0].character.length).to eq(3)
  end

  xit "expects something" do
  end

end
