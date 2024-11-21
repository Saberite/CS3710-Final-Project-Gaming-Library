require 'rails_helper'

RSpec.describe "libraries/show", type: :view do
  before(:each) do
    assign(:library, Library.create!(
      game_name: "Game Name",
      game_desc: "Game Desc",
      gamer: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Game Name/)
    expect(rendered).to match(/Game Desc/)
    expect(rendered).to match(//)
  end
end
