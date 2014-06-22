require 'spec_helper'

describe Score do
  it { should have_db_column(:value).of_type(:integer).with_options(null: false) }
  it { should have_db_column(:thing_id).of_type(:integer).with_options(null: false) }
  it { should have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  it { should have_db_index([:thing_id, :user_id]).unique(true) }
  it { should belong_to(:thing) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:thing) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:value) }
  it { should ensure_inclusion_of(:value).in_array([ -1, 1 ]) }
end
