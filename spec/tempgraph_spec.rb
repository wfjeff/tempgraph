require_relative 'spec_helper'

describe "graph page" do

  def app
    TempGraphController
  end

  it "displays tempgraph" do
    expect(page).to have_content("Hello, William")
  end

  it "takes temp and time parameters and graphs them" do
    post '/', :temp => 80
    expect(page).to have_content("80")
  end
end
