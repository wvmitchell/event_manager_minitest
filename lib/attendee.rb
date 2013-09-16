class Attendee

  attr_accessor :first_name, :last_name, :phone_number

  def initialize(data=nil)
    if data
      @first_name = data[:first_name]
      @last_name = data[:last_name]
      @phone_number = clean_phone_number data[:phone_number]
    end
  end

  def clean_phone_number(number)
    unless number == nil
      number = number.tr('^0-9', '')
      if number.length == 11 then number = number[1..-1] end
    end
  end

end