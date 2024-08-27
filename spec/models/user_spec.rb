require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Валидации' do
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:patronymic) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:nationality) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:gender) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_numericality_of(:age).only_integer.is_greater_than_or_equal_to(0).is_less_than(90) }
    it { should validate_inclusion_of(:gender).in_array(%w[male female]) }
  end

  context 'Ассоциации' do
    it { should have_many(:interest_users).dependent(:destroy) }
    it { should have_many(:interests).through(:interest_users) }
    it { should have_many(:skill_users).dependent(:destroy) }
    it { should have_many(:skills).through(:skill_users) }
  end
end
