Feature: Scrape dataset info
  In an automated pipeline
  I want to gather initial information about published data from a web page,
  including the location to fetch the data from.

  Scenario: Scrape ONS
    Given I scrape the page "https://www.ons.gov.uk/businessindustryandtrade/business/businessinnovation/datasets/foreigndirectinvestmentinvolvingukcompanies2013inwardtables"
    Then the data can be downloaded from "https://www.ons.gov.uk/file?uri=/businessindustryandtrade/business/businessinnovation/datasets/foreigndirectinvestmentinvolvingukcompanies2013inwardtables/current/annualforeigndirectinvestmentinward2016.xls"
    And the title should be "Foreign direct investment involving UK companies: Inward tables"
    And the publication date should be "2017-12-01"
    And the next release date should be "2018-12-03"
    And the description should start "Inward datasets including data for flows, positions and earnings."
    And the contact email address should be "mailto:fdi@ons.gov.uk"

  Scenario: ONS metadata profile
    Given I scrape the page "https://www.ons.gov.uk/businessindustryandtrade/business/businessinnovation/datasets/foreigndirectinvestmentinvolvingukcompanies2013inwardtables"
    Then dct:title should be `"Foreign direct investment involving UK companies: Inward tables"@en`
    And dct:description should be `"Inward datasets including data for flows, positions and earnings."@en`
    And dct:publisher should be `gov:office-for-national-statistics`
    And dct:issued should be `"2017-12-01"^^xsd:date`
    And dcat:contactPoint should be `<mailto:fdi@ons.gov.uk>`

  Scenario: Scrape gov.uk template
    Given I scrape the page "https://www.gov.uk/government/statistics/immigration-statistics-october-to-december-2017-data-tables"
    And select the distribution given by
      | key       | value                                                      |
      | mediaType | application/vnd.oasis.opendocument.spreadsheet             |
      | title     | Entry clearance visas granted outside the UK data tables immigration statistics October to December 2017 volume 1 |
    Then the data can be downloaded from "https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/683359/entry-visas1-oct-dec-2017-tables.ods"

  Scenario: Scrape nrscotland
    Given I scrape the page "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/migration/migration-statistics/migration-between-scotland-and-overseas"
    Then the title should be "Migration between Scotland and Overseas"
    And the description should start "Migration between Scotland and overseas refers to people moving between"

  Scenario: nrscotland downloads
    Given I scrape the page "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/migration/migration-statistics/migration-between-scotland-and-overseas"
    And select the distribution given by
      | key       | value                                                      |
      | mediaType | application/vnd.ms-excel                                   |
      | title     | Migration between administrative areas and overseas by sex |
    Then the data can be downloaded from "https://www.nrscotland.gov.uk/files//statistics/migration/2018-july/tab-z1-overseas-mig-flows-admin-sex-hb-2001-02-latest-july-18.xlsx"

  Scenario: Scrape NISRA
    Given I scrape the page "https://www.nisra.gov.uk/publications/2017-mid-year-population-estimates-northern-ireland-new-format-tables"
    Then the title should be "2017 Mid Year Population Estimates for Northern Ireland (NEW FORMAT TABLES)"
    And dct:issued should be `"2018-06-28"^^xsd:date`
    And dcat:keyword should be `"Population, Mid Year Population Estimates"@en`
    And dct:publisher should be `gov:northern-ireland-statistics-and-research-agency`
    And select the distribution given by
      | key       | value                                       |
      | mediaType | application/vnd.ms-excel                    |
      | title     | All areas - Components of population change |
    And the data can be downloaded from "https://www.nisra.gov.uk/sites/nisra.gov.uk/files/publications/MYE17_CoC.xlsx"