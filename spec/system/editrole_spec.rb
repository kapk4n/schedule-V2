require 'rails_helper'

RSpec.describe "Editroles", type: :system do
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

  scenario 'Editing role vaild' do
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
    fill_in :user_name, with: 'asf2'
    fill_in :user_email, with: 'asf@fs'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#create_user-btn').click
    expect(1).to eq User.count

    visit administration_path
    User.first.admin!
    fill_in :id_input, with: '2'
    find('#edit_role-btn').click
    select "teacher", :from => "role"
    find('#change_role-btn').click
    expect(Teach.count).to eq 0

    visit administration_path
    expect(Teach.count).to eq 1
  end

  scenario 'Editing role ivalid id' do
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
    fill_in :user_name, with: 'asf2'
    fill_in :user_email, with: 'asf@fs'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#create_user-btn').click
    expect(1).to eq User.count

    visit administration_path
    User.first.admin!
    fill_in :id_input, with: '10'
    expect(current_path).to eq administration_path

    visit administration_path
    expect(0).to eq Teach.count
  end

  scenario 'Editing role invaild role' do
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
    fill_in :user_name, with: 'asf2'
    fill_in :user_email, with: 'asf@fs'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#create_user-btn').click
    expect(1).to eq User.count

    visit administration_path
    User.first.admin!
    fill_in :id_input, with: '2'
    find('#edit_role-btn').click
    select "", :from => "role"
    find('#change_role-btn').click

    visit administration_path
    expect(Teach.count).to eq 0
  end
end
