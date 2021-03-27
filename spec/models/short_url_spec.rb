require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  subject { build(:short_url) }
  describe 'Associations' do
    it { should belong_to(:user) }
  end
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it { should validate_presence_of(:slug) }
    it { should validate_presence_of(:original_url) }
    it { should validate_uniqueness_of(:slug) }
    it 'is not valid with a wrong format for original url' do
      subject.original_url = 'a simple string'
      expect(subject).not_to be_valid
    end
  end
end