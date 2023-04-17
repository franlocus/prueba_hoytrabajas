require 'rails_helper'

RSpec.describe 'Banks' do
  let!(:user) { create(:user) }
  let!(:bank) { create(:bank) }

  before do
    sign_in(user)
    visit banks_path
  end

  context 'when listing banks' do
    it 'lists the banks' do
      expect(page).to have_content(bank.name)
    end
  end

  context 'when showing a bank' do
    it 'shows the bank' do
      visit bank_path(bank)

      expect(page).to have_content(bank.name)
    end
  end

  context 'when creating a bank' do
    context 'with valid name' do
      it 'creates a bank' do
        click_on I18n.t('bank.new')
        fill_in 'bank_name', with: 'Standard Bank'

        find('input[name="commit"]').click
        expect(page).to have_content(I18n.t('bank.created'))
      end
    end

    context 'with invalid name' do
      it 'does not create with blank name' do
        click_on I18n.t('bank.new')
        fill_in 'bank_name', with: ''

        find('input[name="commit"]').click
        expect(page).to have_content(I18n.t('errors.messages.blank'))
      end

      it 'does not create with a name taken' do
        click_on I18n.t('bank.new')
        fill_in 'bank_name', with: bank.name

        find('input[name="commit"]').click
        expect(page).to have_content(I18n.t('errors.messages.taken'))
      end

      it 'does not create with a long name' do
        click_on I18n.t('bank.new')
        fill_in 'bank_name', with: SecureRandom.alphanumeric(60)

        find('input[name="commit"]').click
        expect(page).to have_content(I18n.t('errors.messages.too_long', count: 50))
      end
    end
  end

  context 'when updating a bank' do
    context 'with valid name' do
      it 'updates the bank' do
        visit edit_bank_path(bank)

        fill_in 'bank_name', with: 'Standard updated Bank'

        find('input[name="commit"]').click
        expect(page).to have_content(I18n.t('bank.updated'))
      end
    end

    context 'with invalid name' do
      it 'does not update with blank name' do
        visit edit_bank_path(bank)

        fill_in 'bank_name', with: ''

        find('input[name="commit"]').click
        expect(page).to have_content(I18n.t('errors.messages.blank'))
      end

      it 'does not update with a long name' do
        visit edit_bank_path(bank)

        fill_in 'bank_name', with: SecureRandom.alphanumeric(60)

        find('input[name="commit"]').click
        expect(page).to have_content(I18n.t('errors.messages.too_long', count: 50))
      end
    end
  end

  context 'when destroying a bank', js: true do
    it 'destroys the bank' do
      visit bank_path(bank)

      accept_confirm do
        click_on I18n.t('bank.destroy')
      end

      expect(page).to have_content(I18n.t('bank.destroyed'))
    end
  end
end
