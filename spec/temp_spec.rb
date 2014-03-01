require_relative 'spec_helper'

describe "hello page" do

  def app
    TestApp
  end

  xit "displays tempgraph" do
    get '/'
    expect(last_response.body).to eq("GRAPH")
  end

  xit "takes temp and time parameters and graphs them" do
    post '/', :temp => 80
    expect(last_response.body).to eq("GRAPH")
  end
end