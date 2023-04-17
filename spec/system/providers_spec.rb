require 'rails_helper'

RSpec.describe 'Provider' do
  let!(:user) { create(:user) }
  let!(:bank) { create(:bank) }
  let!(:provider) { create(:provider) }

  before do
    sign_in(user)
    create_list(:provider, 15, bank_name: bank.name)
    visit providers_path
  end

  describe 'listing providers' do
    it 'lists and paginate providers ' do
      expect(page).to have_content(provider.name, count: 10)
      expect(page).to have_content(I18n.t('provider.edit'), count: 10)
      expect(page).to have_content(I18n.t('provider.destroy'), count: 10)
    end
  end

  describe 'showing a provider' do
    it 'shows the provider' do
      click_link(provider.name, match: :first)

      expect(page).to have_content(provider.name)
    end
  end

  def submit_form
    find('input[name="commit"]').click
  end

  def fill_in_fields_with_valid_data
    fill_in 'provider_name', with: 'New Standard Provider'
    fill_in 'provider_nit', with: '123456789-1'
    fill_in 'provider_contact_person_name', with: 'Sam Wilson'
    fill_in 'provider_contact_person_number', with: '123456789'
    select(provider.bank_name, from: 'provider_bank_name')
    fill_in 'provider_bank_account_number', with: '123456789012345'
  end

  describe 'creating a provider' do
    before { click_on I18n.t('provider.new') }

    context 'with all attributes valid' do
      it 'creates a provider' do
        fill_in_fields_with_valid_data
        submit_form
        expect(page).to have_content(I18n.t('provider.created'))
      end
    end

    context 'with invalid attributes' do
      it 'does not create with blank fields' do
        fill_in 'provider_name', with: ''

        submit_form
        expect(page).to have_content(I18n.t('errors.messages.blank'))
      end

      it 'does not create with a invalid NIT format' do
        fill_in 'provider_nit', with: '112345678999-11'

        submit_form
        expect(page).to have_content('123456789-1')
      end

      it 'does not create with a long contact number' do
        fill_in 'provider_contact_person_number', with: '12345678910111213'

        submit_form
        expect(page).to have_content(I18n.t('errors.messages.too_long', count: 10))
      end
    end
  end

  describe 'updating a provider' do
    before { visit edit_provider_path(provider) }

    context 'with all attributes valid' do
      it 'updates the provider' do
        fill_in_fields_with_valid_data
        fill_in 'provider_name', with: 'Junior Provider'

        submit_form
        expect(page).to have_content('Junior Provider')
        expect(page).to have_content(I18n.t('provider.updated'))
      end
    end

    context 'with invalid attributes' do
      it 'does not update with blank fields' do
        fill_in 'provider_name', with: ''

        submit_form
        expect(page).to have_content(I18n.t('errors.messages.blank'))
      end

      it 'does not update with a invalid NIT format' do
        fill_in 'provider_nit', with: '112345678999-11'

        submit_form
        expect(page).to have_content('123456789-1')
      end

      it 'does not update with a long contact number' do
        fill_in 'provider_contact_person_number', with: '12345678910111213'

        submit_form
        expect(page).to have_content(I18n.t('errors.messages.too_long', count: 10))
      end
    end
  end

  context 'when destroying a provider', js: true do
    it 'destroys the provider' do
      visit provider_path(provider)

      accept_confirm do
        click_on I18n.t('provider.destroy')
      end

      expect(page).to have_content(I18n.t('provider.destroyed'))
    end
  end
end
