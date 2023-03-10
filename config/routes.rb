Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do 
    get 'posetion', to: 'poseshaemost#show'
    post 'posetion', to: 'poseshaemost#show'
    post 'posit', to: 'poseshaemost#open'
    post 'posetion/edit', to: 'poseshaemost#jedit'

    get 'ed_subject/edit'
    post 'ed_sub', to: 'ed_subject#created'
    get 'ed_sub/ed', to: 'ed_subject#delsub'
    post 'ed_sub/ed', to: 'ed_subject#new'
    # post 'ed_sub/del', to: 'ed_subject#dele'

    get 'creatinguser/new'
    get 'creatinguser/edit'
    post 'creatus', to: 'creatinguser#edit'

    get 'editrole/new'
    get 'editrole/created'
    post 'edrole', to: 'editrole#created'

    get 'schedule', to: 'schedule#bmstu_schedule'
    post 'new', to: 'schedule#new'

    root 'main#index'

    get 'password', to: 'passwords#edit', as: :edit_password
    patch 'password', to: 'passwords#update'

    get "sign_up", to: "registrations#new"
    post "sign_up", to: "registrations#create"

    delete "logout", to: "sessions#destroy"

    get "profile", to: "profile#edit"
    post "profile_hw", to: "profile#homew"
    get "sub_prof", to: "profile#edsubj"

    get "administration", to: "administration#edit"
    post "admin_role", to: "administration#update"
    post "admin_deleting", to: "administration#deleting"

    get "sign_in", to: "sessions#new"
    post "sign_in", to: "sessions#create"

    get "password/reset", to: "password_resets#new"
    post "password/reset", to: "password_resets#create"

    get "password/reset/edit", to: "password_resets#edit"
    patch "password/reset/edit", to: "password_resets#update"

    get 'about', to: "about#index"
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
  end
end
