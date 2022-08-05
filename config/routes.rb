Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  get '/', to: 'home#index', as: 'home'
  get '/result', to: 'home#result', as: 'result'
end
