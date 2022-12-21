require 'rails_helper'

RSpec.describe Teach, type: :model do
  subject {
    User.create(email: "example@mail.ru", password: "password", name: "asfa", role: 1)
    Teach.new(user_id: 1)
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "created?" do
    1 == Teach.count
  end
end
