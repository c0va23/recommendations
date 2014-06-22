require 'spec_helper'

describe User do
  it { should have_db_column(:name).with_options(null: false) }
  it { should have_db_column(:admin).with_options(null: false, default: false) }
  it { should validate_presence_of(:name) }

  it { should have_many(:scores).dependent(:destroy) }
  it { should have_many(:things).through(:scores) }
  it { should have_many(:comments).dependent(:destroy) }
end
