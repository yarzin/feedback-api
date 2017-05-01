module Api
	module V1
		class FeedbacksController < ApplicationController
			include FeedbacksDoc
			def index
				@feedbacks = Feedback.all
				render json: @feedbacks, status: :ok
			end

			def create
					@feedback = Feedback.new(feedback_params)
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
				params.permit :age, :name, :date, :id_last_request, :attachment
			end
		end
	end
end