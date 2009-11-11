class WelcomeController < ApplicationController
  def index
  end
  def csvtest
    require "fastercsv"
   
    file = RAILS_ROOT + "/db/floors.csv"
    @resp =FasterCSV.parse(file)
    
    #require "net/http"
    #require "uri"
    #url = URI.parse("https://westpac.wayfinder.com.au/exchange/GetReport.aspx?ReportID=61&OutputFormat=csv")
    #post_args1 = { 'Passphrase' => 'dee558b9-f58d-43d9-b811-2e0bb5632361', 'submit'=>'RUN!' }
    #@resp = Net::HTTP.post_form(url, post_args1)
    #@resp = Net::HTTP.post_form(URI.parse("https://westpac.wayfinder.com.au/exchange/GetReport.aspx?ReportID=61&OutputFormat=csv"),
    #                  {'Passphrase' => 'dee558b9-f58d-43d9-b811-2e0bb5632361'})
    
  end
end