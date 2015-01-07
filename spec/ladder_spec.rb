require 'spec_helper'
require 'starcraft'

describe Starcraft do

  let(:ladder){ Starcraft::Ladder.new(178045) }

  it "expects a new ladder to be a Ladder" do
    expect(ladder.class).to eq(Starcraft::Ladder)
  end

  it "expects a new ladder to be a Ladder" do
    expect(ladder).to eq(Starcraft::Ladder)
  end

end
