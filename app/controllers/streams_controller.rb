class StreamsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: %i[get_segregated_products]

    def get_segregated_products
        data = []

        Stream.all.order(name: :asc).each do |stream|
            stream_data = {
                text: stream.name,
                children: []
            }
            stream.products.order(name: :asc).each do |product|
                stream_data[:children] << {
                    id: "#{stream.id},#{product.id}",
                    text: product.name
                }
            end

            data << stream_data
        end

        render json: data
    end
end
