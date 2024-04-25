class Ticket
	def initialize
		@guests = []
	end

	def add_guest(age)
		@guests << { age: age }
	end

	def total_charges
		total = 0
		@guests.each do |guest|
			total += calculate_price(guest[:age])
		end
		total
	end

	def display_ticket_details
		@guests.each_with_index do |guest, index|
			puts "Guest #{index + 1} (age: #{guest[:age]})"
		end
	end

	private
  
	def calculate_price(age)
		case
		when age <= 2
			0
		when age < 18
			100
		when age < 60
			500
		else
			300
		end
	end
end
  
ticket = Ticket.new

# Ticketing counter input
print "Enter the number of guests: "
num_guests = gets.chomp.to_i

num_guests.times do |i|
	print "Enter age of guest #{i + 1}: "
	age = gets.chomp.to_i
	ticket.add_guest(age)
end

# Display ticket details and total charges
puts "\nTicket Details:"
ticket.display_ticket_details
puts "\nTotal Charges: INR #{ticket.total_charges}"

# Security personnel validation
puts "\nSecurity Validation:"
ticket.display_ticket_details
