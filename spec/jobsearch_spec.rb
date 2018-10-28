require 'rspec'
require_relative '../lib/jobsearch.rb'
# this test is supposed to test the whether or not a response contained a specific word
describe JobSearch do
    job = JobSearch.new
    it "initialize sets the url to 'https://jobs.github.com/positions.json'" do
        expect(job.get_jobs('newyork')).to eql('18 jobs in Newyork')
    end
end