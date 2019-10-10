require_relative '../lib/mairie_christmas'

describe "cities method" do
  it "should return a tab of hashes" do
    expect(cities(["avernes","cergy"])).not_to be_nil
  end
end