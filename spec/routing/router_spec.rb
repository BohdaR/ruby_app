require 'rails_helper'

RSpec.describe 'router.rb', type: :routing do
  it 'routes /result to the home/result controller' do
    expect(get: '/result').to route_to('home#result')
  end

  it 'routes / to the home/index controller' do
    expect(get: '/').to route_to('home#index')
  end
end
