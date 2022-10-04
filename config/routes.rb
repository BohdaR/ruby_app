# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?

  get '/', to: 'home#index', as: 'home'
  get '/result', to: 'home#result', as: 'result'
end
