require 'spec_helper'

describe Thing do
  it { should have_db_column(:name).with_options(null: false) }
  it { should have_db_column(:approved).with_options(null: true, default: nil) }
  it { should have_db_index(:name).unique(true) }

  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_presence_of(:name) }

  it { should have_many(:tag_of_things).dependent(:destroy) }
  it { should have_many(:tags).through(:tag_of_things) }
  it { should have_many(:scores).dependent(:destroy) }
  it { should have_many(:users).through(:scores) }

  describe 'scope :recommendations_for' do
    let!(:user) { create(:user) }

    let!(:tag1) { create(:tag) }
    let!(:tag2) { create(:tag) }
    let!(:tag3) { create(:tag) }
    let!(:tag4) { create(:tag) }

    let!(:scored_thing1) { create(:thing, tags: [ tag1, tag2 ]) }
    let!(:scored_thing2) { create(:thing, tags: [ tag2, tag3 ]) }

    let!(:good_thing1) { create(:thing, tags: [ tag1 ]) }
    let!(:good_thing2) { create(:thing, tags: [ tag2 ]) }
    let!(:bad_thing1) { create(:thing, tags: [ tag3 ]) }
    let!(:bad_thing2) { create(:thing, tags: [ tag3 ]) }

    before do
      Score.create!(user: user, thing: scored_thing1, value: 1)
      Score.create!(user: user, thing: scored_thing2, value: -1)
    end

    subject { Thing.recommendations_for(user) }

    it { should include(good_thing1) }
    it { should include(good_thing2) }
    it { should_not include(bad_thing1) }
    it { should_not include(bad_thing2) }
  end

  describe 'scope :not_scored_for' do
    let!(:user) { create(:user) }
    let!(:scored_thing) { create(:thing) }
    let!(:other_thing) { create(:thing) }

    before { Score.create(user: user, thing: scored_thing, value: 1) }

    subject { Thing.not_scored_for(user) }

    it { should include(other_thing) }
    it { should_not include(scored_thing) }
  end
end
