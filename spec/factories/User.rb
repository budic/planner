FactoryGirl.define do

  factory :admin, class: User do
    email "admin@example.com"
    password  "changeme"
    role      3
  end
  
  factory :user, class: User do
    email "user@example.com"
    password  "changeme"
    role      1
  end

end
