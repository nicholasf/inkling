Feature: Home - Dashboard 

Scenario: Unauthenticated users should not have access to the dasboard
  When I go to "the dashboard"
  Then I should see "Sign in"
