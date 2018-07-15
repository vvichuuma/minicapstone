
require "unirest"
require "tty-prompt"

system "clear"

# prompt = TTY::Prompt.new
# input = prompt.select("Choose your destiny?", ["one", "two", "three","four","q"])


while 3 > 0


if input == "q"
   break

elsif input == "one"

  response = Unirest.get("http://localhost:3000/guitar")

   con = response.body
   puts JSON.pretty_generate(con)


elsif input == "two"

  response = Unirest.get("http://localhost:3000/acoustic")

  con = response.body
  puts JSON.pretty_generate(con)

elsif input == "three"
  
   response = Unirest.get("http://localhost:3000/electric")
   con = response.body

   puts JSON.pretty_generate(con)

elsif input == "four"
  
   response = Unirest.get("http://localhost:3000/bass")
   con = response.body

   puts JSON.pretty_generate(con)

else 

  puts "Unknown action"

 end 
    
end    
    


