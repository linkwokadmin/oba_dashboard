class DashboardsController < ApplicationController
    include ActionView::Helpers::DateHelper
    skip_before_action :verify_authenticity_token, only: %i[reactor_attribute_data]

    def index
        if params[:stream_status_filter].present?
            @from_date = Date.strptime(params[:stream_status_filter][:from_date], '%d/%m/%Y')
            @to_date = Date.strptime(params[:stream_status_filter][:to_date], '%d/%m/%Y')
            @stream = Stream.find_by name: params[:stream_status_filter][:stream]
            @stage = Stage.find_by name: params[:stream_status_filter][:stage]

            @stream_statuses = []
            total_delay = 0
            count = 0

            batches = Batch.where(id: BatchLog.where(stream: @stream, stage: @stage).pluck(:batch_id).uniq)
            batches.each do |batch|
                batch_logs = batch.batch_logs.where(stream: @stream, stage: @stage).order(timestamp: :asc)
                batch_start_time = batch_logs.first.timestamp
                batch_end_time = batch_logs.last.timestamp

                if batch_end_time >= @from_date && batch_end_time <= @to_date #&& batch_end_time != (batch_end_time.to_date + 6.hours + 55.minutes)
                    bct_plan = batch.product.master_bmrs.where(stage: @stage).first.bct
                    bct_actual = batch_end_time - batch_start_time
                    delay = bct_actual - bct_plan
                    total_delay += ((delay > 0) ? delay : 0)
                    count += 1

                    puts '-------------------------------------------------------------------------------------'
                    puts "Batch : #{batch.name}"
                    puts "Start Time : #{batch_start_time}"
                    puts "End Time : #{batch_end_time}"
                    puts "Planned BCT : #{bct_plan}"
                    puts "Actual BCT : #{bct_actual}"
                    puts "Delay : #{delay}"
                    puts '-------------------------------------------------------------------------------------'

                    @stream_statuses << {
                        stage: @stage.name,
                        batch: batch.name,
                        on_date: batch_end_time.to_date.to_s(:long),
                        delay: delay,
                    }
                end
            end

            @average_delay = ((count > 0) ? (total_delay / count) : nil)
        else
            @to_date = Date.today
            @from_date = @to_date - 1.day
            @stream = Stream.find_by name: Stream::STREAM_1
            @stage = Stage.find_by name: Stage::STAGE_CC
        end
    end

    def batch_flow
        if params[:batch_details_filter].present?
            @batch = Batch.find params[:batch_details_filter][:batch] rescue nil
        end
    end

    def reactor_attribute_data
        data = {
            labels: [],
            datasets: [
                {
                    label: '',
                    fill: false,
                    backgroundColor: '#33b5e5',
                    borderColor: '#33b5e5',
                    data: []
                }
            ]
        }
        total = 0.0
        count = 0

        if params[:reactor_attribute_filter].present?
            from_date = Date.strptime(params[:reactor_attribute_filter][:from_date], '%d/%m/%Y')
            to_date = Date.strptime(params[:reactor_attribute_filter][:to_date], '%d/%m/%Y')
            stream_product = params[:reactor_attribute_filter][:stream_product].split(',')
            stream_id = stream_product[0].to_i
            product_id = stream_product[1].to_i
            data[:datasets][0][:label] = params[:reactor_attribute_filter][:attribute]
            attribute = data[:datasets][0][:label].parameterize.underscore


            batch_logs = BatchLog.includes(:batch).where(stream_id: stream_id, batches: {product_id: product_id}).where('timestamp >= ? AND timestamp <= ?', from_date, to_date)
            batch_logs.each do |batch_log|
                data[:labels] << batch_log.timestamp.to_s(:long)
                value = batch_log.send(attribute)
                data[:datasets][0][:data] << value
                if value.present?
                    total += value
                    count += 1
                end
            end
        end

        render json: {
            data: data,
            average_value: ((count > 0) ? (total / count).round(2) : 0)
        }
    end
end
