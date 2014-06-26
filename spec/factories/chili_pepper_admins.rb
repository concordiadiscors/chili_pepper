# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chili_pepper_admin, :class => 'ChiliPepper::Admin' do
      email "admin@fake_website.ie"
      password "fake_password"
  end
end
