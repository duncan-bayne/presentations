# FactoryGirl

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

FactoryGirl.define do
  factory :player do
    name "Jane Doe"
  end
end

# + Faker

FactoryGirl.define do
  factory :player do
    name Faker::Name.name
  end
end

# + simple-cov

require 'simplecov'
SimpleCov.start
