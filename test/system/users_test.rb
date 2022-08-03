# frozen_string_literal: true

require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test 'visiting the index' do
    visit users_url
    assert_selector 'h1', text: 'Users'
  end

  test 'creating a User' do
    visit users_url
    click_on 'New User'

    fill_in 'Uid', with: @user.UID
    fill_in 'User address', with: @user.user_address
    fill_in 'User age', with: @user.user_age
    fill_in 'User email', with: @user.user_email
    fill_in 'User gender', with: @user.user_gender
    fill_in 'User name', with: @user.user_name
    fill_in 'User phone', with: @user.user_phone
    click_on 'Create User'

    assert_text 'User was successfully created'
    click_on 'Back'
  end

  test 'updating a User' do
    visit users_url
    click_on 'Edit', match: :first

    fill_in 'Uid', with: @user.UID
    fill_in 'User address', with: @user.user_address
    fill_in 'User age', with: @user.user_age
    fill_in 'User email', with: @user.user_email
    fill_in 'User gender', with: @user.user_gender
    fill_in 'User name', with: @user.user_name
    fill_in 'User phone', with: @user.user_phone
    click_on 'Update User'

    assert_text 'User was successfully updated'
    click_on 'Back'
  end

  test 'destroying a User' do
    visit users_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'User was successfully destroyed'
  end
end
