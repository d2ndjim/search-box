require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Article model' do
    @user = User.create(email: 'tom@example.com', password: '123456')
    subject { Article.new(user_id: @user, name: 'Football', link: 'https://www.themanual.com/auto/fastest-cars-in-the-world/' ) }
    before { subject.save }

    it 'should check if the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should check if the link is not blank' do
      subject.link = nil
      expect(subject).to_not be_valid
    end
  end
end
