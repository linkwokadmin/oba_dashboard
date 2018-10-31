Rails.application.routes.draw do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    devise_for :users

    root to: 'dashboards#index'

    resources :dashboards, only: %i[index] do
        collection do
            get :batch_flow
            get :batch_flow_state
            get :batch_calendar
            get :batch_event
            get :batch_daily_report

            post :reactor_attribute_data
        end
    end

    resources :streams, only: %i[] do
        collection do
            post :get_segregated_products
        end
    end
end
