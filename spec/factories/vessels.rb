FactoryGirl.define do
  sequence :vessel_title do |n|
    "Vessel #{n}"
  end

  factory :vessel do
    title { generate :vessel_title }
    hold_capacity 1000
  end

  factory :invalid_vessel, class: 'Vessel' do
    title nil
    hold_capacity nil
  end
end
