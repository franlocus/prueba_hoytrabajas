require 'rails_helper'

RSpec.describe Bank do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(50) }
end
