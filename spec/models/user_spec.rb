require 'spec_helper'

describe User do

  before do
    @user = create :user
  end

  it { should validate_presence_of :email }
  it { should validate_presence_of :password_digest }
  it { should validate_presence_of :name }

  it { should validate_uniqueness_of :email }

  it { should_not allow_value("foobar").for(:email) }
  it { should allow_value("foo@bar.com").for(:email) }

  it { should have_many :projects }
  it { should have_many :resources }
  it { should have_many :notes }

end
