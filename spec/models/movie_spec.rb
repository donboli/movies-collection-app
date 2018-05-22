require 'rails_helper'

RSpec.describe Movie, type: :model do
  before do
    ActsAsTenant.default_tenant = create(:user)
  end

  after do
    ActsAsTenant.default_tenant = nil
  end

  it { is_expected.to validate_presence_of(:name) }
end
