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
    number = number.tr('^0-9', '') unless number.nil?
    number = correct_length(number) unless number.nil?
  end

  def correct_length(number)
    number.length == 10 ? number : repair_num(number)
  end

  def repair_num(num)
    num.length > 11 || num.length < 10 ? '0000000000' : num[1..-1]
  end

end