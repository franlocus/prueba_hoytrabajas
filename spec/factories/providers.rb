FactoryBot.define do
  factory :provider do
    name { 'Default Provider Ltd' }
    nit { '123456789-1' }
    contact_person_name { 'John Doe' }
    contact_person_number { '123456789' }
    before(:create) do |provider|
      provider.bank_name = (Bank.first || create(:bank)).name
    end

    bank_account_number { '123456789012345' }
  end
end
