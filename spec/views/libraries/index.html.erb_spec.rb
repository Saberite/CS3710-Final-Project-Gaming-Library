require 'rails_helper'

RSpec.describe "libraries/index", type: :view do
  before(:each) do
    assign(:libraries, [
      Library.create!(
        game_name: "Game Name",
        game_desc: "Game Desc",
        gamer: nil
      ),
      Library.create!(
        game_name: "Game Name",
        game_desc: "Game Desc",
        gamer: nil
      )
    ])
  end

  it "renders a list of libraries" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Game Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Game Desc".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
