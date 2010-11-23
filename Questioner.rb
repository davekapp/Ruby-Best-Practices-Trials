require "stringio"

class Questioner
  
  InvalidResponseError = Class.new(StandardError)
  
  def initialize(input=STDIN,output=STDOUT)
    @input = input
    @output = output
  end
  
  def ask(question)
    @output.puts question
    response = yes_or_no(@input.gets.chomp)
    response.nil? ? ask(question) : response
  end
  
  def ask_and_return_response(question, options={})
    raise ArgumentError unless !options[:on_yes].nil? && !options[:on_no].nil?
    
    @output.puts question
    input = @input.gets
    input.chomp if !input.nil?
    begin
      response = yes_or_no(input)
    rescue InvalidResponseError # not interactive, so don't repeat the question
      response = false
    end
    
    response ? options[:on_yes] : options[:on_no]
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