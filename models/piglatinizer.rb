require 'pry'

class PigLatinizer
  attr_accessor :text

  def initialize
    @text = text
  end

  def split_phrase(text)
    array = text.split(" ")
  end
  
  def validate_letters(text)
    vowels = %w(a e i o u) #ends with a cons == 'ay'
    if vowels.include?(text[0].downcase)
      @pl = text + 'way' #start with a vowel
    else
      letter = text.split(/([aeiouAEIOU].*)/) # will part anything before the first vowel
      @pl = letter[1] + letter[0] + 'ay'
    end
   @pl
  end
    # if text.match(/\A[aeiouAEIOU][a-zA-Z]*/) #begins with vowel
    #   @pl = text + 'way'
    # elsif text.match(/\A[^aeiouAEIOU][aeiouAEIOU][a-zA-Z]*/) #cons + vowel
    #   arr = text.chars
    #   el = arr.shift
    #   @pl = arr.push(el).join("") + 'ay'
    # elsif text.match(/\A[^aeiouAEIOU]{2}[a-zA-Z]*/) # Ex: program
    #   arr = text.chars
    #   a = arr.slice(0,2).join("")
    #   b = arr.slice(2..-1).join("")
    #   @pl =  b + a + 'ay'
    # elsif text.match(/\A[^aeiouAEIOU]{3}[a-zA-Z]*/) # Ex: spring
    #   arr = text.chars
    #   a = arr.slice(0,3).join("")
    #   b = arr.slice(3..-1).join("")
    #   @pl =  b + a + 'ay'
    # else
    #   puts nil
    # end
      

  def piglatinize(text) #either word or phrase
    array = split_phrase(text)
    words_array = []
    if array.size == 1
      return validate_letters(text)
    else 
      array.each do |text|
        words_array << validate_letters(text)
      end
      return words_array.join(" ")
    end
  end
end