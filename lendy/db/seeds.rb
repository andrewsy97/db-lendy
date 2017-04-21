School.create!([
                   {name: "Northeastern University", city: "Boston"},
                   {name: "MIT", city: "Cambridge"},
                   {name: "Tufts University", city: "Medford"}
               ])
user_set = [
                 {email: "andrew@gmail.com", encrypted_password: "#$2a$11$cDsB3FWCgyS9cTrRFhbKCeoSO8AwzGFBJICUw2JPH/dCoJ.16zi6q", remember_created_at: nil, sign_in_count: 11, current_sign_in_at: "2017-04-20 03:29:19", last_sign_in_at: "2017-04-12 20:37:32", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "::1", name: "Andrew Sy", school_id: 1},
                 {email: "blenderrenter@mit.edu", encrypted_password: "#$2a$11$1usX1Gb/EuN24aTgNhWRNuZLbtvKuDkAOpJfd0qYf1sEKtagjmqTi", remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-12 19:13:53", last_sign_in_at: "2017-04-12 19:13:53", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Blender Renter", school_id: 2},
                 {email: "nii@gmail.com", encrypted_password: "#$2a$11$ItKWNyK1EvuOx7Upfu4oQeBqUWGf3xnSxhYbby1cWUMT9OdMeuIba", remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-12 19:20:30", last_sign_in_at: "2017-04-12 19:20:30", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Nii Ako Boi-Doku", school_id: 1},
                 {email: "imdead@tufts.edu", encrypted_password: "#$2a$11$t4vC2twHJAcSO70Zfk4fo.8nrU17Ll4KvwpSF83ox.cIvUWFarSqq", remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-12 19:28:38", last_sign_in_at: "2017-04-12 19:28:38", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Bojack Horseman", school_id: 3}
             ]

user_set.each() do |f|
  u = User.new
  u.email = f[:email]
  u.password = 'password'+f[:name][0]
  u.password_confirmation = 'password'+f[:name][0]
  u.remember_created_at = f[:remember_created_at]
  u.sign_in_count=f[:sign_in_count]
  u.current_sign_in_at=f[:current_sign_in_at]
  u.last_sign_in_at=f[:last_sign_in_at]
  u.current_sign_in_ip=f[:current_sign_in_ip]
  u.last_sign_in_ip=f[:last_sign_in_ip]
  u.name=f[:name]
  u.school = School.find(f[:school_id])
  u.save!
end

ItemType.create!([
                     {name: "Vacuum"},
                     {name: "Pan"},
                     {name: "Blender"}
                 ])
Item.create!([
                 {description: "New vacuum, barely used!", user_id: 1, item_type_id: 1, price: 12, name: "New Vacuum"},
                 {description: "Sexy vacuum it's amazing!!", user_id: 4, item_type_id: 1, price: 10, name: "Sexy Vacuum"},
                 {description: "Battered ceramic pan :(", user_id: 1, item_type_id: 2, price: 5, name: "Teflon Pan"},
                 {description: "Will blend all your databases.", user_id: 2, item_type_id: 3, price: 30, name: "Blendermatic 3200!"},
                 {description: "Best pan in the world!", user_id: 3, item_type_id: 2, price: 12, name: "State of the Art Ceramic Non-stick"}
             ])

Reservation.create!([
                        {return_date: "2017-05-11 21:48:20", returned: false, item_id: 1, user_id: 2, accepted: true},
                        {return_date: "2017-04-10 16:42:16", returned: true, item_id: 3, user_id: 4, accepted: true}
                    ])
