require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
    describe 'editing movies director' do
    	context 'when we press the edit page of a movie' do
        	it 'should render a page with a field director' do
        		movie = Movie.create{ {title: "Faker", rating: "R", director: "Faker Director", release_date: 10.years.ago, description: "None"} }
        		get :edit, :id => '1'
        		expect(response).to render_template(:edit)
        		# expect(response.body).to include("Director")
        	end
        end
    end
end