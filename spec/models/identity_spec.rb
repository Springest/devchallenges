require 'spec_helper'

describe Identity do
  describe ".find_for_oauth" do
    subject { Identity.find_for_oauth(auth) }

    let(:auth) { Object.new }
    let(:user) do
      User.create(
        name: "1337 Dev",
        email: "1337@developer.com",
        password: "1337developer"
      )
    end

    before do
      auth.stub(:provider) { 'github' }
      auth.stub(:uid) { 'foobar' }
    end

    it { should be_a Identity }
    it { should_not be_valid }
    it { should_not be_persisted }

    context "when the Identity already exists" do
      before do
        i = Identity.find_for_oauth(auth)
        i.user = user
        i.save!
      end

      it { should be_a Identity }
      it { should be_valid }
      it { should be_persisted }
    end
  end
end
