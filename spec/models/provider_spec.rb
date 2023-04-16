require 'rails_helper'

RSpec.describe Provider do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to allow_value('123456789-1', '').for(:nit) }
    it { is_expected.not_to allow_value('123456789', '123456789-', '123456789-10').for(:nit) }

    it { is_expected.to validate_presence_of(:contact_person_name) }
    it { is_expected.to validate_length_of(:contact_person_number).is_at_most(10) }

    it { is_expected.to validate_inclusion_of(:bank_name).in_array(Bank.pluck(:name)) }

    it { is_expected.to validate_length_of(:bank_account_number).is_at_most(15) }
  end
end
