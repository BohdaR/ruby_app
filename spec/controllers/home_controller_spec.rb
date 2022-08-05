require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it describe 'renders the index template' do
    get :index
    expect(response).to render_template('index')
  end

  it describe 'renders the result template' do
    get :result
    expect(response).to render_template('result')
  end
end
