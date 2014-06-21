require 'spec_helper'

describe Thing do
  it { should have_db_column(:name) }
  it { should have_db_index(:name).unique(true) }

  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_presence_of(:name) }

  it { should have_many(:tag_of_things).dependent(:destroy) }
  it { should have_many(:tags).through(:tag_of_things) }
end
