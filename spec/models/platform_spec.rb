require 'rails_helper'

describe Platform, type: :model do
  it 'validates presence of a name and launch year' do
    expect(Platform.new(name: nil, launch_year: 1989)).to be_invalid
    expect(Platform.new(name: 'some plat', launch_year: nil)).to be_invalid
    expect(Platform.new(name: 'some name', launch_year: 1989)).to be_valid
  end
end
