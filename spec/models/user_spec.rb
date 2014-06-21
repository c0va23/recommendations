require 'spec_helper'

describe User do
  it { should have_db_column(:name).with_options(null: false) }
  it { should validate_presence_of(:name) }
end
