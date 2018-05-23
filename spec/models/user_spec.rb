require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it 'should validate the email format' do
    subject.email = Faker::Internet.email
    subject.valid?
    expect(subject.errors.keys).not_to include(:email)

    subject.email = 'wrongformat'
    subject.valid?
    expect(subject.errors.keys).to include(:email)
  end
end
