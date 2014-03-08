class Twine < ActiveRecord::Base
  has_many :readings

  def chart_hash
    chart_hash = readings.inject({}) do |log, reading| 
      log[reading.created_at] = reading.temp
      log
    end
  end

  def min
    self.readings.collect{|reading|reading.temp}.min
  end

    def max
    self.readings.collect{|reading|reading.temp}.max
  end

  def range(margin = 0)
    {min: self.min - margin, max: self.max + margin}
  end

  def get_reading
    session = Capybara::Session.new(:selenium)
    session.visit 'https://twine.cc/login?next=%2F'
    session.fill_in 'email', :with => "wm.jeffries@gmail.com"
    session.fill_in 'password', :with => "33west26"
    sleep 1 + rand(1..10)/50
    session.click_button 'signin'
    sleep 1
    noko = Nokogiri::HTML(session.html)
    session.driver.quit
    temp = noko.css(".temperature-value").text.to_i
    Reading.create(temp: temp)
  end
end
