msg = Test::MyMessage.new(:myField => "zomgkittenz")
open("test_msg", "wb") do |f|
  msg.serialize(f)
end
encoded = msg.serialize_to_string # or msg.to_s
Test::MyMessage.parse(encoded) == msg # true
