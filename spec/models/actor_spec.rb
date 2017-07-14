require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
  end
  describe 'database columns' do
    it { should have_db_column :first_name }
    it { should have_db_column :last_name }
  end
  describe 'associations' do
    it { is_expected.to have_many :movies }
  end
end
