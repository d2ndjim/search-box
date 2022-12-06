require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(email: 'lekan@example.com', password: '123456')
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'should validate the email' do
    subject.email = 'lekanj@example.com'
    expect(subject).to be_valid
  end
end
