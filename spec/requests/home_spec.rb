# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Homes", type: :request do
  it "returns http success for root path" do
    get "/"
    expect(response).to have_http_status(:success)
  end

  it "returns http success for result page" do
    get "/result?github_login=BohdaR"
    expect(response).to have_http_status(:success)
  end

  it "returns http success for result page with incorrect params" do
    get "/result?github_login=some_incorrect_param"
    expect(response).to have_http_status(:success)
  end

  it "does not render a different template for index page" do
    get "/"
    expect(response).to render_template(:index)
    expect(response.body).to include("<h1>GitHub repos finder</h1>")
    expect(response.body).to include('placeholder="Enter GitHub login"')
  end

  it "does not render a different template for result page" do
    get "/result?github_login=BohdaR"
    expect(response).to render_template(:result)
    expect(response.body).to include("Drugstore")
    expect(response.body).to include("BohdaR")
    expect(response.body).to include("Повернутись в головне меню")
  end

  it "does not render a different template for result page with incorrect params" do
    get "/result?github_login=some_incorrect_param"
    expect(response).to render_template(:result)
    expect(response.body).to include("<h1>Невдалось отримати дані</h1>")
    expect(response.body).to include("Повернутись в головне меню")
  end
end
