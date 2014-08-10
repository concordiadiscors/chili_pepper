# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chili_pepper_annotation, :class => 'Annotation' do
    menu_id 1
    position 1
    description "MyString"
  end
end
