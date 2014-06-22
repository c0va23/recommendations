require 'spec_helper'

describe Comment do
  it { should have_db_column(:message).of_type(:text).with_options(null: false) }
  it { should have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  it { should have_db_column(:thing_id).of_type(:integer).with_options(null: false) }

  it { should validate_presence_of(:message) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:thing) }
end
