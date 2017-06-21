FactoryGirl.define do
	factory :weapon do
		name { ["Holdout Blaster", "Light Blaster Pistol", "Blaster Pistol", "Heavy Blaster", "Blaster Carbine", "Blaster Riffle"].sample }
		skill "Light Range"
		range "medium"
		encum 1
		hp 1
		price 200
		rarity 5
	end
end