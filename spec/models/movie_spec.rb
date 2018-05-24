require 'rails_helper'

RSpec.describe Movie, type: :model do
  before do
    ActsAsTenant.current_tenant = create(:user)
  end

  after do
    ActsAsTenant.current_tenant = nil
  end

  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:rating).only_integer }
  it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5) }
end
