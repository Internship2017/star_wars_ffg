FactoryGirl.define do
  factory :gear do
    name { ["Comlink (handheld)", "Comlink (long range)", "Holo-messenger", "Pioneer Long-Range Hypertransceiver", "Whistler Encryption Module", "Remote DVI Activator (Short Range)"].sample }
    encum 1
    price { rand(200...210) }
    rarity { rand(1...7) }
    gear_type "Communications"
  end
end
