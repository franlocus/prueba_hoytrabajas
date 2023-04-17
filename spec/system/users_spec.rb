require 'rails_helper'

RSpec.describe 'Users' do
  before do
    create(:user, email: 'user@example.com', password: 'foobar')
    visit new_user_session_path
  end
 
  describe 'when signing in' do
    context 'with valid inputs' do
      it 'signs in' do
        within '#new_user' do
          fill_in 'user_email', with: 'user@example.com'
          fill_in 'user_password', with: 'foobar'
          click_on I18n.t('devise.sessions.new.sign_in')
        end

        expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
      end
    end

    context 'with invalid inputs' do
      it 'does not sign in with wrong password' do
        within '#new_user' do
          fill_in 'user_email', with: 'user@example.com'
          fill_in 'user_password', with: 'idontremembermypassword'
          click_on I18n.t('devise.sessions.new.sign_in')
        end

        expect(page).not_to have_content(I18n.t('devise.sessions.signed_in'))

      end

      it 'does not sign in with blank fields' do
        within '#new_user' do
          fill_in 'user_email', with: 'user@example.com'
          fill_in 'user_password', with: ''
          click_on I18n.t('devise.sessions.new.sign_in')
        end

        expect(page).not_to have_content(I18n.t('devise.sessions.signed_in'))

      end
    end
  end

  describe 'when signing up' do
    before do
      visit new_user_registration_path
    end

    context 'with valid inputs' do
      it 'signs up' do
        within '#new_user' do
          fill_in 'user_email', with: 'new-user@example.com'
          fill_in 'user_password', with: 'foobar'
          fill_in 'user_password_confirmation', with: 'foobar'
          click_on I18n.t('devise.registrations.new.sign_up')
        end

        expect(page).to have_content(I18n.t('devise.registrations.signed_up'))
      end
    end

    context 'with invalid inputs' do
      it 'does not sign up with taken email' do
        within '#new_user' do
          fill_in 'user_email', with: 'user@example.com'
          fill_in 'user_password', with: 'foobar'
          fill_in 'user_password_confirmation', with: 'foobar'

          click_on I18n.t('devise.registrations.new.sign_up')

        end

        expect(page).not_to have_content(I18n.t('devise.registrations.signed_up'))
      end

      it 'does not sign up with blank fields' do
        within '#new_user' do
          fill_in 'user_email', with: 'user@example.com'
          fill_in 'user_password', with: ''

          click_on I18n.t('devise.registrations.new.sign_up')
        end

        expect(page).not_to have_content(I18n.t('devise.registrations.signed_up'))
      end
    end
  end
end
