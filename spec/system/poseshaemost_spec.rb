require 'rails_helper'

RSpec.describe "Poseshaemosts", type: :system do
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

  scenario 'creating subject and Show Poseshaemost' do
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

    visit root_path
    User.first.admin!
    find('#ed_roots-btn').click
    find('#creating-btn').click
    fill_in :user_name, with: 'stud1'
    fill_in :user_email, with: 'stud1@bmstu.ru'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#create_user-btn').click
    expect(2).to eq User.count

    visit administration_path
    User.first.admin!
    fill_in :id_input, with: '2'
    find('#edit_role-btn').click
    select "teacher", :from => "role"
    find('#change_role-btn').click
    expect(0).to eq Teach.count

    visit administration_path
    find('#create_subj-btn').click
    fill_in :subj, with: 'TOY'
    select "asf2", :from => "prepodovat"
    find('#edit_subj-btn').click
    expect(1).to eq Teach.count

    visit administration_path
    expect(1).to eq Predmet.count

    visit administration_path
    find('#edit_subj-btn').click
    select "TOY", :from => "name"
    select "Monday", :from => "day"
    fill_in :time, with: '5'
    find('#create_sched-btn').click
    expect(1).to eq Predmet.count

    visit administration_path
    expect(1).to eq Schedule.count

    visit posetion_path
    select "TOY", :from => "name"
    find('#show_posesh-btn').click
    expect(current_path).to eq posetion_path
  end

  scenario 'changing params to student by admin' do
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

    visit root_path
    User.first.admin!
    find('#ed_roots-btn').click
    find('#creating-btn').click
    fill_in :user_name, with: 'stud1'
    fill_in :user_email, with: 'stud1@bmstu.ru'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#create_user-btn').click
    expect(2).to eq User.count

    visit administration_path
    User.first.admin!
    fill_in :id_input, with: '2'
    find('#edit_role-btn').click
    select "teacher", :from => "role"
    find('#change_role-btn').click
    expect(0).to eq Teach.count

    visit administration_path
    find('#create_subj-btn').click
    fill_in :subj, with: 'TOY'
    select "asf2", :from => "prepodovat"
    find('#edit_subj-btn').click
    expect(1).to eq Teach.count

    visit administration_path
    expect(1).to eq Predmet.count

    visit administration_path
    find('#edit_subj-btn').click
    select "TOY", :from => "name"
    select "Monday", :from => "day"
    fill_in :time, with: '5'
    find('#create_sched-btn').click
    expect(1).to eq Predmet.count

    visit administration_path
    expect(1).to eq Schedule.count

    visit posetion_path
    select "TOY", :from => "name"
    find('#show_posesh-btn').click
    expect(current_path).to eq posetion_path

    visit posetion_path
    select "TOY", :from => "name"
    find('#show_posesh-btn').click
    find('#show_params-btn1').click
    fill_in :fs1, with: '3'
    find('#save_params-btn').click
    expect(current_path).to eq posetion_path

    visit posetion_path
    select "TOY", :from => "name"
    find('#show_posesh-btn').click
    expect(3).to eq find('#id1').text.to_i
  end

  scenario 'changing params to student by teacher' do
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

    visit root_path
    User.first.admin!
    find('#ed_roots-btn').click
    find('#creating-btn').click
    fill_in :user_name, with: 'stud1'
    fill_in :user_email, with: 'stud1@bmstu.ru'
    fill_in :user_password, with: '123'
    fill_in :user_password_confirmation, with: '123'
    find('#create_user-btn').click
    expect(2).to eq User.count

    visit administration_path
    User.first.admin!
    fill_in :id_input, with: '2'
    find('#edit_role-btn').click
    select "teacher", :from => "role"
    find('#change_role-btn').click
    expect(0).to eq Teach.count

    visit administration_path
    find('#create_subj-btn').click
    fill_in :subj, with: 'TOY'
    select "asf2", :from => "prepodovat"
    find('#edit_subj-btn').click
    expect(1).to eq Teach.count

    visit administration_path
    expect(1).to eq Predmet.count

    visit administration_path
    find('#edit_subj-btn').click
    select "TOY", :from => "name"
    select "Monday", :from => "day"
    fill_in :time, with: '5'
    find('#create_sched-btn').click
    expect(1).to eq Predmet.count

    visit administration_path
    expect(1).to eq Schedule.count

    visit posetion_path
    select "TOY", :from => "name"
    find('#show_posesh-btn').click
    expect(current_path).to eq posetion_path

    visit root_path
    find('#logout-btn').click
    expect(current_path).to eq root_path

    visit root_path
    find('#login-btn').click
    fill_in :email, with: 'asf@fs'
    fill_in :password, with: '123'
    User.first.admin!
    User.first.admin!
    find('#login_accaunt-btn').click
    expect(current_path).to eq root_path

    visit posetion_path
    select "TOY", :from => "name"
    find('#show_posesh-btn').click
    find('#show_params-btn1').click
    fill_in :fs1, with: '3'
    find('#save_params-btn').click
    expect(current_path).to eq posetion_path

    visit posetion_path
    select "TOY", :from => "name"
    find('#show_posesh-btn').click
    expect(3).to eq find('#id1').text.to_i
  end
end
