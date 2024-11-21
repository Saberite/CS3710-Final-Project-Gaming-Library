require 'rails_helper'

RSpec.describe "libraries/new", type: :view do
  before(:each) do
    assign(:library, Library.new(
      game_name: "MyString",
      game_desc: "MyString",
      gamer: nil
    ))
  end

  it "renders new library form" do
    render

    assert_select "form[action=?][method=?]", libraries_path, "post" do

      assert_select "input[name=?]", "library[game_name]"

      assert_select "input[name=?]", "library[game_desc]"

      assert_select "input[name=?]", "library[gamer_id]"
    end
  end
end
