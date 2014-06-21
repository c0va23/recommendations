require 'spec_helper'

describe Tag do
  it { should have_db_column(:value).with_options(null: false) }
  it { should have_db_index(:value).unique(true) }
  it { should validate_presence_of(:value) }
  it { should validate_uniqueness_of(:value).case_insensitive }
end
