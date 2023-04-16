class Provider < ApplicationRecord
  validates :name, presence: true
  validates :nit, format: { with: /\A\d{9}-\d{1}\z/ }, allow_blank: true
  validates :contact_person_name, presence: true
  validates :contact_person_number, length: { maximum: 10 }
  validates :bank_name, inclusion: { in: Bank.pluck(:name) }
  validates :bank_account_number, length: { maximum: 15 }
end
