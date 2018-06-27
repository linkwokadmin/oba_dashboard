class DashboardsController < ApplicationController
    include ActionView::Helpers::DateHelper

    def index
        if params[:filter].present?
            @from_date = Date.strptime(params[:filter][:from_date], '%d/%m/%Y')
            @to_date = Date.strptime(params[:filter][:to_date], '%d/%m/%Y')
            @stream = Stream.find_by name: params[:filter][:stream]

            @stream_statuses = []

            Stage.all.each do |stage|
                batches = Batch.where(id: BatchLog.where(stream: @stream, stage: stage).pluck(:batch_id).uniq)
                batches.each do |batch|
                    batch_logs = batch.batch_logs.where(stream: @stream, stage: stage).order(timestamp: :asc)
                    batch_start_time = batch_logs.first.timestamp
                    batch_end_time = batch_logs.last.timestamp

                    if batch_end_time >= @from_date && batch_end_time <= @to_date && batch_end_time != (batch_end_time.to_date + 6.hours + 55.minutes)
                        bct_plan = batch.product.master_bmrs.where(stage: stage).first.bct
                        bct_actual = batch_end_time - batch_start_time
                        delay = bct_actual - bct_plan

                        if delay > 0
                            puts '-------------------------------------------------------------------------------------'
                            puts "Batch : #{batch.name}"
                            puts "Start Time : #{batch_start_time}"
                            puts "End Time : #{batch_end_time}"
                            puts "Planned BCT : #{bct_plan}"
                            puts "Actual BCT : #{bct_actual}"
                            puts "Delay : #{delay}"
                            puts '-------------------------------------------------------------------------------------'

                            @stream_statuses << {
                                stage: stage.name,
                                batch: batch.name,
                                on_date: batch_end_time.to_date.to_s(:long),
                                delay: distance_of_time_in_words(delay)
                            }
                        end
                    end
                end
            end
        else
            @to_date = Date.today
            @from_date = @to_date - 1.day
            @stream = Stream.find_by name: Stream::STREAM_1
        end
    end
end
