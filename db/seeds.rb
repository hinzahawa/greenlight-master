# frozen_string_literal: true

# Role.create_default_roles("greenlight")
# Rake::Task['admin:create'].invoke
$invite_code = (10000..99999).to_a.shuffle
$i = 1
$num = 601
codeid = []
sale_name= ['Prospect','Potential','Up&Cros','Enterprise','Goverment','Online recruit',]
while $i < $num  do
  $new_code = $invite_code.pop
  if $i>=1 && $i<=100
  codeid.push( {id: $i, invite_code: $new_code,sale_name: sale_name[0]})
  elsif $i>=101 && $i<=200
    codeid.push( {id: $i, invite_code: $new_code,sale_name: sale_name[1]})
  elsif $i>=201 && $i<=300
    codeid.push( {id: $i, invite_code: $new_code,sale_name: sale_name[2]})
  elsif $i>=301 && $i<=400
    codeid.push( {id: $i, invite_code: $new_code,sale_name: sale_name[3]})
  elsif $i>=401 && $i<=500
    codeid.push( {id: $i, invite_code: $new_code,sale_name: sale_name[4]})
  else
    codeid.push( {id: $i, invite_code: $new_code,sale_name: sale_name[5]})
  end
  $i +=1
end



while !codeid.empty? do
  begin
    Codeid.create(codeid)
  rescue
    codeid = codeid.drop(1) #removing the first if the id already exist.
  end
end