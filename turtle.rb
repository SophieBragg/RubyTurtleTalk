class Turtle
  attr_accessor :happy, :respond, :runaway, :name, :color, :fed, :tease
end

@turtle = Turtle.new
@turtle.fed = false

if @turtle.fed == true
	@turtle.happy = true
else 
	@turtle.happy = false
end

public
def from(position)
  self[position..-1]
end

def to(position)
  self[0..position]
end

def form_text(text)
	text = text.gsub(/\W/, '')
	return text
end

def ask_me()
puts "Ask me something:"
STDOUT.flush
@question = STDIN.gets.strip.downcase
respond()
end

def respond()
if @question.gsub(/\W/, '') == "areyouhappy"
	if @turtle.happy == true
		puts ":)"
		puts "i am so happy i am about to poo!"
		@turtle.respond = true
	elsif @turtle.happy == false
		if @turtle.fed == false
		  puts ":("
		  puts "Feed me! Type f to feed me."
		  STDOUT.flush
		  feed_me = gets.chomp
		else 
	          puts ":("
		  puts "Hug me! You hurt my feelings. Type h to hug me."
		  STDOUT.flush
		  hug_me = gets.chomp
		end
		if feed_me == "f"
			@turtle.happy=true
			@turtle.fed=true
			puts "Thanks!"
	        end
		if hug_me == "h"
			@turtle.happy=true
			puts "Burp!"
	        end
		@turtle.respond = false
	end
	ask_me()
elsif form_text(@question.to(11)) == "yournameis"
	@turtle.name = @question.from(13)
	puts "Ok call me #{ @turtle.name }"
	ask_me
elsif form_text(@question.to(6)) == "youare"
	@turtle.color = @question.from(8)
	puts "Ok I am #{ @turtle.color }"
	ask_me
elsif form_text(@question.to(13)) == "yourmasteris"
	@turtle.tease = @question.from(15)
	puts "Yuppers you are #{ @turtle.tease }"
	ask_me
elsif form_text(@question.to(10)) == "turtlemeat"
	puts "I will run away since you are so cruel"
elsif form_text(@question) == "whatsthatsmell"
	puts "I'm not the one who put raw hamburger in thier socks."
	ask_me
elsif form_text(@question) == "doyouloveme"
	puts "If I say yes will you feed me?"
	ask_me
elsif form_text(@question) == "bye"
	puts "Toodles"
elsif form_text(@question) == "forreal"
	puts "Yeah seriously"
	ask_me
elsif form_text(@question) == "stopit"
	puts "I already told you im not the one who put hamburger in their socks!"
	ask_me
elsif form_text(@question) == "areyouhungry"
	if @turtle.fed == false
	puts "Yes! So feed me already! Type f to feed me."
	STDOUT.flush
		feed_me = gets.chomp
		if feed_me == "f"
			@turtle.happy=true
			@turtle.fed=true
			puts "Thanks!"
	        end
	else
		puts "I'm stuffed. Were those beans?"
	end
	ask_me
elsif form_text(@question) == "puke" or form_text(@question) == "gag"
	@turtle.happy = false
	@turtle.fed = false
	puts "Bluuuuuuuuh!"
	ask_me
elsif form_text(@question) == "poke" or form_text(@question) == "slap"
	@turtle.happy = false
	puts "Ouch!"
	ask_me
elsif form_text(@question) == "couldyoulearntoloveme" 
	puts "Old greg? Seriously?"
	ask_me
elsif form_text(@question) == "tellmeajoke"
	if @turtle.happy == true
		puts "Knock knock"
		STDOUT.flush
		knock_knock = gets
		if form_text(knock_knock) == "whosthere"
			puts "You ya bozo"
		ask_me
		end
	elsif @turtle.happy == false
		puts "No you meanie"
	end
else puts "You are a very, very confused person."
	ask_me
end

end

ask_me()



