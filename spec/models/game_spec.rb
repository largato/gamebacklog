require 'rails_helper'

describe Game, type: :model do
  let(:plat) { Platform.create(name: 'some plat') }

  it 'validates presence of a name and platform' do
    expect(Game.new(name: nil, platform: plat)).to be_invalid
    expect(Game.new(name: 'some game', platform: nil)).to be_invalid
    expect(Game.new(name: 'some game', platform: plat)).to be_valid
  end
end
