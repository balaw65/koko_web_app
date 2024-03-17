class Student < ApplicationRecord
   before_save { self.email = email.downcase }

   # Date restrictions:
   VALID_STARTING_DATE_REGEX = /\A[0-1][0-9]\/[0-9][0-9]\/[0-9]{4}\z/
   validates_presence_of :startingdate
   validates_format_of   :startingdate, with: VALID_STARTING_DATE_REGEX

   # Level restrictions:
   validates :currentlevel, :inclusion => 1..50
   # Lesson restrictions:
   validates :currentlesson, :inclusion => 1..50
 
   validates_presence_of :favoritegenre
   validates_presence_of :interests
 

end
