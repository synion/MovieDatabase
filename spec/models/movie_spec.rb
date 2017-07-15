require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :revenue }
  end
  describe 'database columns' do
    it { should have_db_column :name }
    it { should have_db_column :revenue }
  end
  describe 'associations' do
    it { is_expected.to belong_to :genre }
    it { is_expected.to have_many :actors }
  end
end
