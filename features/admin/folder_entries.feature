Feature: Folder Entries
  Folder entries are the key to all content storage and organisation

  Scenario: /admin defaults to the folder_entry index
    Given I go to admin/inkling
    Then I should be on /admin/inkling
