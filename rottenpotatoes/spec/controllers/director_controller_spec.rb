require 'rails_helper'

RSpec.describe DirectorController, type: :controller do
    
    before :each do
        fake_movie = mock('Movie')
        fake_movie.stub(:title).and_return('Casablanca')
        fake_movie.stub(:rating).and_return('PG')
        fake_movie.name_with_rating.should == 'Casablanca (PG)'
    end
end
