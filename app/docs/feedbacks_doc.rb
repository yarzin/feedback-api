module FeedbacksDoc
	extend Apipie::DSL::Concern

	def_param_group :main_params do
    param :age, Integer, desc: 'The field user age. '
    param :name, String, desc: 'The name user. '
    param :date, Date , desc: 'Date for .'
    param :id_last_request, Integer, desc: 'The last request id not required. '
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

  api :POST, '/feedbacks', 'Create Feedback'
  description <<-EOS
    == Create Feedback
    Is used for creating feedback
      curl -v localhost:5000/api/v1/feedbacks -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"age": 2, "name": "Ostap Ferneza", "date": "2017-04-29T21:00:00.000Z", "id_last_request": "1"}'
    EOS
  param_group :main_params
  def create; end  

  api :PUT, '/feedbacks/:id', 'Update feedback'
    description <<-EOS
      == Update feedback
    Is used for updating feedback
      curl -v localhost:5000/api/v1/feedbacks/1 -X PUT -H "Accept: application/json" -H "Content-Type: application/json" -d '{"age": 2, "name": "Ostap Ferneza", "date": "2017-04-29T21:00:00.000Z", "id_last_request": "1"}'
    EOS
  param_group :main_params
  def update; end

end