# email:string
# password_digest:string
# 
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
  has_secure_password
  has_many :predmet
  has_many :list

  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: 'Put correct email' }, :uniqueness => {message: 'You have an account'}
  validates :name, presence: true, format: {with: /[a-zA-Z]/, message: 'Put correct email' }


  enum role: [ :student, :teacher, :admin ]
end
