require 'spec_helper'

describe Tag do
  it { should have_db_column(:value).with_options(null: false) }
  it { should have_db_index(:value).unique(true) }

  it { should validate_presence_of(:value) }
  it { should validate_uniqueness_of(:value).case_insensitive }

  it { should have_many(:tag_of_things).dependent(:destroy) }
  it { should have_many(:things).through(:tag_of_things) }

  describe 'scope :recommendations_for' do
    let!(:user) { create(:user) }

    let!(:good_tag1) { create(:tag) }
    let!(:good_tag2) { create(:tag) }
    let!(:bad_tag) { create(:tag) }

    let!(:good_thing) { create(:thing, tags: [ good_tag1, good_tag2 ]) }
    let!(:bad_thing) { create(:thing, tags: [ good_tag2, bad_tag ]) }

    before do
      Score.create!(user: user, thing: good_thing, value: 1)
      Score.create!(user: user, thing: bad_thing, value: -1)
    end

    subject { Tag.recommendations_for(user) }

    it { should include(good_tag1) }
    it { should include(good_tag2) }
    it { should_not include(bad_tag) }
  end
end
