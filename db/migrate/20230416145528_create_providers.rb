class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :nit
      t.string :contact_person_name
      t.string :contact_person_number
      t.string :bank_name
      t.string :bank_account_number

      t.timestamps
    end
  end
end
