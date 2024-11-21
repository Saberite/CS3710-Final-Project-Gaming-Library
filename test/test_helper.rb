ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class GamerTest < ActiveSupport::TestCase
    test "should raise error when saving gamer without first name" do
        assert_raises ActiveRecord::RecordInvalid do
            Student.create!(last_name: "Test", favorite_genere: "Action", username: "Tester" )
        end
    end
    
    test "should raise error when saving gamer without last name" do
      assert_raises ActiveRecord::RecordInvalid do
          Student.create!(first_name: "SecondTest", favorite_genere: "Scfi", username: "Tester2" )
      end
    end

    test "should raise error when saving gamer without favorite genere" do
      assert_raises ActiveRecord::RecordInvalid do
          Student.create!(first_name: "ThirdTest", last_name: "LastName", favorite_genere: "Horror")
      end
    end

    test "should raise a pass when saving gamer without correct params" do
      assert_raises ActiveRecord::RecordInvalid do
          Student.create!(first_name: "ValidFirst", last_name: "ValidLast", favorite_genere: "Fantasy", username: "ValidUser" )
      end
    end

    test "should raise a pass when saving library with Game name" do
      assert_raises ActiveRecord::RecordInvalid do
        Student.create!(first_name: "ValidFirst2", last_name: "ValidLast2", favorite_genere: "Coop", username: "ValidUser2", game_name: "Coop Game",
        game_desc: "It's a coop game" )
      end
    end

  end
end
