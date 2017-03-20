FactoryGirl.define do
  sequence :cargo_title do |n|
    "Cargo #{n}"
  end

  factory :cargo do
    title { generate :cargo_title }
    port
    open_date "2017-03-01" #Time.zone.now
    capacity 1000
  end

  factory :invalid_cargo, class: 'Cargo' do
    title nil
    port nil
    open_date nil
    capacity nil
  end
end
