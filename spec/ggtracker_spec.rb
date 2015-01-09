require 'spec_helper'
require 'starcraft'

describe Starcraft do
  let(:ggtracker){ Starcraft::GGTracker.new }
  before do
    ggtracker.bnet("Killjoy",6196405,1)
  end

  it "expects the object to have ggtracker data" do
    expect(ggtracker.name).to eq("Killjoy")
    expect(ggtracker.apm).to eq(81)
  end

end
