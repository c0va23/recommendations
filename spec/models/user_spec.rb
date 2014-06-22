require 'spec_helper'

describe User do
  it { should have_db_column(:name).with_options(null: false) }
  it { should validate_presence_of(:name) }
  it { should have_many(:scores).dependent(:destroy) }
  it { should have_many(:things).through(:scores) }
end
