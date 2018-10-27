require 'rspec'
require_relative '../lib/jobsearch.rb'
# this test is supposed to test the whether or not a response contained a specific word
describe JobSearch do
  context 'When testing the JodSearch class' do 
      
    it "The job_type method should return 'True'" do 
       job = JobSearch.new
       job_test = job.job_type("ruby")
       expect(job_test).to eq true
    end
    
 end 
end