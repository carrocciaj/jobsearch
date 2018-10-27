class JobSearch
  require 'httparty'

    @@url = 'https://jobs.github.com/positions.json'
    LOCATION = ['newyork', 'boston', 'boulder', 'sanfrancisco', 'losangeles', 'denver', 'chicago']
    DESCRIPTION = ['ruby', 'java', 'go', 'python']
  def initialize
    search_job
  end

  def search_job
    LOCATION.each do |location|
      options= {query: {
        location: location
      }}
      @response = HTTParty.get(@@url, options)
      @jobs = @response.count
      puts @jobs.to_s + " jobs in " + location.capitalize
      DESCRIPTION.each do |desc|
        @ft_count = 0
        @pt_count = 0
        @unknown_count = 0
        @job_desc_lang = 0
        
        job_type(desc)
        puts desc
        puts "Full Time " + (@ft_count.to_f/@jobs.to_f * 100).round(0).to_s + "%"
        puts "Part Time " + (@pt_count.to_f/@jobs.to_f * 100).round(0).to_s + "%"
        puts "Unknown " + (@unknown_count.to_f/@jobs.to_f * 100).round(0).to_s + "%"
      end
    end
  end

  def job_type(desc)
    @response.parsed_response.each do |response|   
      if response["description"].downcase.include? desc
        @job_desc_lang += 1
        if response["type"] == "Full Time"
          @ft_count += 1
        elsif response["type"] == "Part Time"
          @pt_count += 1
        elsif response["type"] == ""
          @unknown_count += 1
        end
      end    
  end

  end
end

JobSearch.new

