## Lab

You are going to make a table for tracking bounties for Space Cowboys.

An entry in the bounty table must have a selection of 4 of these properties:

- name
- species
- bounty value
- danger level (low, medium, high, ermagerdyerderd)
- last known location
- homeworld
- favourite weapon
- cashed_in
- collected_by

## Getting Started Checklist

1. Set up your directory structure
2. Create a Ruby file for your Bounty class
3. Write your class definition in the file - `initialize`, `attr_reader`s, instance variables
4. Make the database - `createdb` in command line
5. Make a .sql file and write some SQL to create your database table
6. Run the .sql file to set up the table (`psql -d data_base_name -f file_name.sql`)
7. Implement `save`, `update` and `delete` methods on your class
8. Implement a `find` method that returns **one** instance of your class (do you have to use a map method? Hmm.)
9. Create `console.rb` to create some new objects and practice your methods (can do this as you are writing the methods to test them)
