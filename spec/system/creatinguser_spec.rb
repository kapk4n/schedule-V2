require 'rails_helper'

RSpec.describe "Creatingusers", type: :system do
  scenario 'Registration, Login in' do
    visit root_path
    find('#sign_up-btn').click
    fill_in :user_name, with: 'asf'
    fill_in :user_email, with: 'kfsk@anskf'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#reg-btn').click
    expect(current_path).to eq root_path

    visit root_path
    find('#login-btn').click
    fill_in :email, with: 'kfsk@anskf'
    fill_in :password, with: '123'
    User.first.admin!
    User.first.admin!
    find('#login_accaunt-btn').click
    expect(current_path).to eq root_path
  end

  scenario 'Registration with invalid params' do
    visit root_path
    find('#sign_up-btn').click
    fill_in :user_name, with: 'asf'
    fill_in :user_email, with: 'kfs'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#reg-btn').click
    expect(current_path).to eq root_path
  end

  scenario 'Creating new account' do
    visit root_path
    find('#sign_up-btn').click
    fill_in :user_name, with: 'asf'
    fill_in :user_email, with: 'kfsk@anskf'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#reg-btn').click
    expect(current_path).to eq root_path

    visit root_path
    find('#login-btn').click
    fill_in :email, with: 'kfsk@anskf'
    fill_in :password, with: '123'
    User.first.admin!
    User.first.admin!
    find('#login_accaunt-btn').click
    expect(current_path).to eq root_path

    visit root_path
    User.first.admin!
    find('#ed_roots-btn').click
    find('#creating-btn').click
    first_sum = User.count
    fill_in :user_name, with: 'asf2'
    fill_in :user_email, with: 'asf@fs'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#create_user-btn').click
    expect(first_sum).to eq User.count

    visit administration_path
    expect(2).to eq User.count

    visit administration_path
    first_sum = User.count
    fill_in :id, with: '2'
    find('#deleting-btn').click
    expect(first_sum).to eq User.count
  end

  scenario 'Registration, Login in' do
    visit root_path
    find('#sign_up-btn').click
    fill_in :user_name, with: 'asf'
    fill_in :user_email, with: 'kfsk@anskf'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#reg-btn').click
    expect(current_path).to eq root_path

    visit root_path
    find('#login-btn').click
    fill_in :email, with: 'kfsk@anskf'
    fill_in :password, with: '123'
    User.first.admin!
    User.first.admin!
    find('#login_accaunt-btn').click
    expect(current_path).to eq root_path

    visit root_path
    find('#prof-btn').click
    find('#back-btn').click
    expect(current_path).to eq '/ru/profile'
  end
end
