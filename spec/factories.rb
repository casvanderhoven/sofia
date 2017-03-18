FactoryGirl.define do
  factory :section do
    name "MyString"
    start_line 1
    end_line 1
    original "MyText"
    translation "MyText"
    chapter nil
  end
  factory :chapter do
    name "MyString"
    start_line 1
    end_line 1
    work nil
  end
  factory :work do
    name "MyString"
    author nil
  end
  factory :author do
    name "MyString"
    category "MyString"
  end
end
