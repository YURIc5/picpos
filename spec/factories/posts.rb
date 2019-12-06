FactoryBot.define do

  factory :post do
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpeg')) }
    text    {"hello"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end

end