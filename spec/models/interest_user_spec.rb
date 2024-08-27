require 'rails_helper'

RSpec.describe InterestUser, type: :model do
  context 'Ассоциации' do
    it { should belong_to(:user) }
    it { should belong_to(:interest) }
  end
end
