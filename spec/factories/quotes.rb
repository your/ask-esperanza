FactoryGirl.define do

  factory :quote do
    sequence(:value) { |n| "Life is #{n} times better then yesterday, today." }
  end

end
