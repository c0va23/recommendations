require 'spec_helper'

describe TagOfThing do
  it { should have_db_column(:tag_id).with_options(null: false) }
  it { should have_db_column(:thing_id).with_options(null: false) }
  it { should belong_to(:tag) }
  it { should belong_to(:thing) }
  it { should validate_uniqueness_of(:tag_id).scoped_to(:thing_id) }
  it { should validate_presence_of(:tag) }
  it { should validate_presence_of(:thing) }
end
