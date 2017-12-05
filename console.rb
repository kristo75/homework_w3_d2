require('pry-byebug')
require_relative('./models/space_cowboys')

Bounty.delete_all()


bounty1 = Bounty.new({
    'name' => 'Kris',
    'species'=> "Human",
    'bounty_value' => '5',
    'danger_level' => 'medium',
  })

  # bounty2 = Bounty.new({



    bounty1.save()
    # # bounty2.save()
    # bounty1.delete()
    bounty1.name = "Alex"
    bounty1.update
    bounty = Bounty.all()

binding.pry
nil
