
require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    let!(:user) { create(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:number_of_guests) }
    it { should validate_presence_of(:date) }

    context 'email uniqueness' do
      subject { create(:reservation, user: user) }
    end
  end
end
