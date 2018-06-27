Rails.application.routes.draw do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    devise_for :users

    root to: 'dashboards#index'

    resources :dashboards, only: %i[index] do
        collection do
            post :reactor_attribute_data
        end
    end

    resources :streams, only: %i[] do
        collection do
            post :get_segregated_products
        end
    end
end
