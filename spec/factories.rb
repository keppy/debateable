FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@test.com" }
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :debate do
    title "Debate title"
  end
    
  factory :proposition do
    title "Prop title"
    user
  end

  factory :opposition do
    title "Opp title"
    user
  end
end
