require 'faker'
Sham.email { Faker::Internet.email }

Avatar.blueprint do
  email
end
