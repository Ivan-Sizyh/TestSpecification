require 'rails_helper'

RSpec.describe Skill, type: :model do
  context 'Ассоциации' do
    it { should have_many(:skill_users) }
    it { should have_many(:users).through(:skill_users) }
  end
end
