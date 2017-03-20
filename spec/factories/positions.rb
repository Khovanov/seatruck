FactoryGirl.define do

  factory :position do
    vessel
    port
    open_date "2017-03-01" #Time.zone.now
  end

  factory :invalid_position, class: 'Position' do
    vessel nil
    port nil
    open_date nil
  end
end
