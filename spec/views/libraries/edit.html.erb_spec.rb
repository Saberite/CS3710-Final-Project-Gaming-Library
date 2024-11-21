require 'rails_helper'

RSpec.describe "libraries/edit", type: :view do
  let(:library) {
    Library.create!(
      game_name: "MyString",
      game_desc: "MyString",
      gamer: nil
    )
  }

  before(:each) do
    assign(:library, library)
  end

  it "renders the edit library form" do
    render

    assert_select "form[action=?][method=?]", library_path(library), "post" do

      assert_select "input[name=?]", "library[game_name]"

      assert_select "input[name=?]", "library[game_desc]"

      assert_select "input[name=?]", "library[gamer_id]"
    end
  end
end
