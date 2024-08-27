require 'rails_helper'

RSpec.describe SkillUser, type: :model do
  context 'Ассоциации' do
    it { should belong_to(:user) }
    it { should belong_to(:skill) }
  end
end
