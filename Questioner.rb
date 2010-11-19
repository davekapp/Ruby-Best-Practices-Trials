class Questioner
  
  InvalidResponseError = Class.new(StandardError)
  
  def ask(question)
    puts question
    response = yes_or_no(gets.chomp)
    response.nil? ? ask(question) : response
  end
  
  def yes_or_no(response)
    case(response)
    when /^y(es)?$/i
      true
    when /^no?$/i
      false
    else
      raise InvalidResponseError.new
    end
  end
  
  def inquire_about_cheese
    ask("Do you like cheese?") ? "Good, cheese is delicious!" : "WHAT!?? YOU DON'T LIKE CHEESE?"
  end
  
end