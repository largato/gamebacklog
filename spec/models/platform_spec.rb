require 'rails_helper'

describe Platform, type: :model do
  it 'validates presence of a name' do
    expect(Platform.new(name: nil)).to be_invalid
    expect(Platform.new(name: 'some plat')).to be_valid
  end
end
