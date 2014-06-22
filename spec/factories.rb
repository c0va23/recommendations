FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Name #{n}" }
  end

  factory :tag do
    sequence(:value) { |n| "Tag #{n}" }
  end

  factory :thing do
    sequence(:name) { |n| "Thing #{n}" }
  end
end
