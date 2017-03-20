FactoryGirl.define do
  sequence :port_title do |n|
    "Port #{n}"
  end

  factory :port do
    title { generate :port_title }
    lat 52.13333333
    lng -10.26666667
  end

  factory :invalid_port, class: 'Port' do
    title nil
    lat nil
    lng nil
  end
end
