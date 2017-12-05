require('pry-byebug')
require_relative('./models/space_cowboys')

Bounty.delete_all()


order1 = Bounty.new({
  'first_name' => "Luke",
  'last_name' => 'Skywalker',
  'quantity' => '1',
  'topping' => 'Napoli'
  })

  order2 = Bounty.new({
    'first_name' => "Darth",
    'last_name' => 'Vader',
    'quantity' => '1',
    'topping' => 'Quattro Formaggi'
    })

    order1.save()
    order2.save()
    order1.delete()
    order1.first_name = "Fred"
    order1.update
    orders = Bounty.all()

binding.pry
nil
