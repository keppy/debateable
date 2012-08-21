FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@test.com" }
    password "foobar"
    password_confirmation "foobar"
  end
    
  factory :proposition do
    sequence(:title) { |n| "Prop title - #{n}" }
    sequence(:slide) { |n| "Prop slide - #{n}" }
    sequence(:footnotes) { |n| "Prop footnotes - #{n}" }
  end
  factory :invalid_proposition, :parent => :proposition do
    title nil
    slide nil
    footnotes nil
  end

  factory :opposition do
    sequence(:title) { |n| "Opp title - #{n}" }
    sequence(:slide) { |n| "Opp slide - #{n}" }
    sequence(:footnotes) { |n| "Opp footnotes - #{n}" }
  end
  factory :invalid_opposition, :parent => :opposition do
    title nil
    slide nil
    footnotes nil
  end
end
