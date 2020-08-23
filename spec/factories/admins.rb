FactoryBot.define do

  factory :admin do
    image                 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    name                  {"安倍"}
    category              {"ビジネス"}
    birth_place           {"北海道"}
    profile               {"hoge"}
    email                 {"kkk@gmail.com"}
    password              {"12345678"}
    password_confirmation {"12345678"}
  end

end