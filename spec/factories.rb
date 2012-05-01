FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "foobar#{n}@example.com" }
    name 'John Stark'
    password 'password'
    password_confirmation 'password'
  end

  factory :project do
    name 'test project'
    user
  end

  factory :resource do
    type 'img'
    value 'http://mockra.com/image.png'
    user
    project
  end

end
