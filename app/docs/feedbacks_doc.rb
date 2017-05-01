module FeedbacksDoc
	extend Apipie::DSL::Concern

	def_param_group :main_params do
    param :age, Integer, required: true, desc: 'The field user age. '
    param :name, String, required: true, desc: 'The name user. '
    param :date, Date, required: true, desc: 'Date for.'
    param :id_last_request, Integer, required: false, desc: 'The last request id not required.'
    param :attachment, ActionDispatch::Http::UploadedFile, 'Url file.'
  end

  api :GET, '/feedbacks', 'All feedbacks '
  description <<-EOS
    == Get Action Feedbacks
    Is used for show feedbacks
      Is used for get all feedbacks
        curl localhost:5000/api/v1/feedbacks -X GET
    EOS
  param_group :main_params
  def index; end

  api :GET, '/feedbacks/:id', 'Show Feedback'
  description <<-EOS
    == Show single feedback
    Is used for show single feedback
      curl -v localhost:5000/api/v1/feedbacks/1
    EOS
  param :id, Integer, desc: 'Id feedback for show. '
  def show; end

  api :POST, '/feedbacks', 'Create Feedback'
  description <<-EOS
    == Create Feedback
    Is used for creating feedback
      curl http://localhost:5000/api/v1/feedbacks -v -F age=23 -F name='Oleg Babiy' -F date='2017-04-29' -F id_last_request=1 -F file=@example.txt
    EOS
  param_group :main_params
  def create; end  



end