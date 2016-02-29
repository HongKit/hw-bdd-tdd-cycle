# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  # fail "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  page.body.index(e1).should < page.body.index(e2)
  # fail "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(",").each do | rating |
    if uncheck
      uncheck("ratings_#{rating}")
    else
      check("ratings_#{rating}")
    end
  end
  # fail "Unimplemented"
end

Then /I should see all the movies/ do
  paeg_movie_count = page.body.scan(/<tr>/).length-1
  db_movie_count = Movie.count
  paeg_movie_count.should == db_movie_count
  # fail "Unimplemented"
end

Then /I should see movies of ratings: (.*)/ do |rating_list|
  rating_list.split(",").each do |rating|
    page.body.should match(/<td>#{rating}<\/td>/)
  end
end

Then /I should not see movies of ratings: (.*)/ do |rating_list|
  rating_list.split(",").each do |rating|
    page.body.should_not match(/<td>#{rating}<\/td>/)
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  m = Movie.find_by(title: movie)
  expect(m.director).to eq(director)
end