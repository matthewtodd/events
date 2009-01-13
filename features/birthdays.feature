Feature: Display Upcoming Birthdays
  In order to remember to greet my friends and family on their birthdays
  I want to see whose birthdays are coming up soon
  
  Scenario: One birthday in the coming week
    Given these people in my address book
      | first_name | last_name | birthday   |
      | Matthew    | Todd      | 1978-04-03 |
    When I ask for upcoming events on 2009-03-31
    Then I should see these results
      """
      Matthew Todd turns 31 in 3 days. (Friday, April 3)
      
      """
