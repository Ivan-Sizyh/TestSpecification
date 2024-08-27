require 'rails_helper'

RSpec.describe Interest, type: :model do
  context 'Ассоциации' do
    it { should have_many(:interest_users) }
    it { should have_many(:users).through(:interest_users) }
  end
end
