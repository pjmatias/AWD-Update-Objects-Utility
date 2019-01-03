require_relative 'awd_classes.rb'
env = String.new
dpc = String.new
xml_content = String.new

#splash page for ux
puts 'Welcome to the AWD Update Objects Utility!'

credentials = Proc.new do |e,d|
		print "User name:"
		$user = gets.chomp
		print "Password:"
		$password = STDIN.noecho(&:gets).chomp
		test = AwdCall.new(e, d)
		testlogin = test.getmodellist
		case testlogin.code
			when '401'
				puts testlogin.body
				raise 'AWD login error!'
			else
				puts
		end
end

env_input = Proc.new do
	print "Environment:"
	env = gets.chomp.downcase
	print "Is env on DPC? (Y or N):"
	dpc = gets.chomp.upcase
	credentials.call(env, dpc)
end

env_input.call
print "Enter path to CSV file containing object IDs to update:"
csv_path = gets.chomp
ids = CSV.read(csv_path)

#loops through each id in array
ids.each do |i|
  $obj_id_var = i[0]
  load 'xml.rb'
  #locks transaction
  call = AwdCall.new(env, dpc, "services/v1/user/instances/#{$obj_id_var}/locked")
  call_resp = call.nocontent('put')

  #updates transaction
  call = AwdCall.new(env, dpc, "services/v1/instances")
  call_resp = call.updateobject($update_xml_content)

  #unlocks transaction
  call = AwdCall.new(env, dpc, "services/v1/user/instances/#{$obj_id_var}/locked")
  call_resp = call.nocontent('delete')

  #releases transaction
  call = AwdCall.new(env, dpc, "services/v1/user/instances/assigned?instances=#{$obj_id_var}")
  call_resp = call.nocontent('delete')
end