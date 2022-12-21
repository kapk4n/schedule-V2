require 'rails_helper'

RSpec.describe "subjects", type: :system do
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

  scenario 'Creating subject' do
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
    expect(User.count).to eq first_sum


    visit administration_path
    User.first.admin!
    fill_in :id_input, with: '2'
    find('#edit_role-btn').click
    select "teacher", :from => "role"
    find('#change_role-btn').click
    expect(Teach.count).to eq 0

    visit administration_path
    find('#create_subj-btn').click
    fill_in :subj, with: 'TOY'
    select "asf2", :from => "prepodovat"
    find('#edit_subj-btn').click
    expect(Teach.count).to eq 1

    visit administration_path
    expect(Predmet.count).to eq 1

    visit administration_path
    find('#edit_subj-btn').click
    select "TOY", :from => "name"
    select "Monday", :from => "day"
    fill_in :time, with: '5'
    find('#create_sched-btn').click
    expect(Predmet.count).to eq 1

    visit administration_path
    expect(Schedule.count).to eq 1
  end

  scenario 'Deleting one schedule' do
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
    find('#create_subj-btn').click
    fill_in :subj, with: 'TOY'
    select "asf2", :from => "prepodovat"
    find('#edit_subj-btn').click
    expect(Teach.count).to eq 1
    # delete_all_subj-btn
    # delete_sched-btn

    visit administration_path
    find('#edit_subj-btn').click
    select "TOY", :from => "name"
    select "Monday", :from => "day"
    fill_in :time, with: '5'
    find('#create_sched-btn').click
    expect(Predmet.count).to eq 1

    visit administration_path
    expect(Schedule.count).to eq 1

    visit administration_path
    find('#edit_subj-btn').click
    select "TOY", :from => "name"
    select "Monday", :from => "day"
    fill_in :time, with: '5'
    find('#delete_sched-btn').click
    expect(Predmet.count).to eq 1

    visit administration_path
    expect(Schedule.count).to eq 0
  end

  scenario 'Deleting all subject' do
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
    find('#create_subj-btn').click
    fill_in :subj, with: 'TOY'
    select "asf2", :from => "prepodovat"
    find('#edit_subj-btn').click
    expect(Teach.count).to eq 1

    visit administration_path
    find('#edit_subj-btn').click
    select "TOY", :from => "name"
    select "Monday", :from => "day"
    fill_in :time, with: '5'
    find('#create_sched-btn').click
    expect(Predmet.count).to eq 1

    visit administration_path
    expect(Schedule.count).to eq 1

    visit administration_path
    find('#edit_subj-btn').click
    select "TOY", :from => "name"
    select "Monday", :from => "day"
    fill_in :time, with: '5'
    find('#delete_all_subj-btn').click
    expect(Predmet.count).to eq 1

    visit administration_path
    expect(Predmet.count).to eq 0
  end
end
