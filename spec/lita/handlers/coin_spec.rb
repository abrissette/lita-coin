require "spec_helper"

describe Lita::Handlers::Coin, lita_handler: true do
  it { is_expected.to route_command("flip a coin").to(:flip) }
  it { is_expected.to route_command("toss a coin").to(:flip) }
  it { is_expected.to route_command("coin flip").to(:flip) }
  it { is_expected.to route_command("coin toss").to(:flip) }

  describe "#flip" do
    it "responds with the results of the flip" do
      send_command("flip a coin")
      expect(replies.last).to match(/(?:Heads|Tails)!/)
    end
  end
end
