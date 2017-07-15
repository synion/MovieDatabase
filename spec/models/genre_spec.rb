require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name}
  end
  describe 'database columns' do
    it { should have_db_column :name }
  end
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many  :movies }
    it { is_expected.to belong_to :actors }
  end
end
