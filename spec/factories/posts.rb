FactoryBot.define do

  factory :post do

    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpeg')) }
    text    {"hello"}
  
  end

end