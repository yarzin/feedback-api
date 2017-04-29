module Api
	module V1
		class FeedbacksController < ApplicationController
			include FeedbacksDoc
			require 'aws-sdk'
			def index
				@feedbacks = Feedback.all
				render json: @feedbacks, status: :ok
			end

			def create
				if params[:file]
					s3 = Aws::S3::Resource.new(Aws::S3::Client.new)  
			    key = File.basename params[:file].path
			    obj = s3.bucket("feedback-adpi").object(params[:file].original_filename)
			    obj.upload_file(params[:file].open)
					@feedback = Feedback.new(
						age: params[:age],
						name: params[:name],
						date: params[:date],
						id_last_request: params[:id_last_request],
						url_file: obj.public_url,
						name_file: obj.key
					)
				else
					@feedback = Feedback.new(feedback_params)
				end
				
				if @feedback.save
					render json: @feedback, status: :created
				else
					render json: { errors: @feedback.errors.full_messages }, status: :unprocessable_entity
				end
			end

			def show
				render json: get_feedback, status: :ok
			end

			private
			def get_feedback
				@feedback = Feedback.find(params[:id])
			end
			def feedback_params
				params.permit :age, :name, :date, :id_last_request
			end
		end
	end
end