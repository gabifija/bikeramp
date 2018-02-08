require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should validate_presence_of(:start_address) }
  it { should validate_presence_of(:destination_address) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:date) }
end
