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
			s3 = Aws::S3::Resource.new(Aws::S3::Client.new)  

		    # Create a key.
		    key = File.basename params[:file].path

		    # Set the bucket and the key.
		    obj = s3.bucket("feedback-api").object(params[:file].original_filename)

		    # Upload the file.
		    obj.upload_file(params[:file].open)
				# @feedback = Feedback.create(feedback_params)
				@feedback = Feedback.new(
					age: params[:age],
					name: params[:name],
					date: params[:date],
					id_last_request: params[:id_last_request],
					url_file: obj.public_url,
					name_file: obj.key
				)
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
				params.permit(:age, :name, :date, :id_last_request, :file)
			end
		end
	end
end