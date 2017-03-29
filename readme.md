# Iplacex Api Docs #

## SetUp  ##
All api (except previously build apis example Unlock etc) will require following header

* MOBILE-APP-TOKEN *needed in all apis*
* UDID             *will received after*
* TOKEN            *will receive after unlock*
* CLIENT-AGENT     * send "ANDROID" or "IOS"

## Config ##

###  ###

## Filtering ##
For any data fetch api filters can be applied on all attributes of entity

format for filtering is:

```
#!javascript

filters = {"filters": {
    "attribute_name": ["value1", "value2"],
    "attribute2": ["value1", "value2"]
  }}
```

Use the above object to generate filter url component
Example: for given filters url component would be 
```
filters[attribute_name][]=value1&filters[attribute_name][]=value2&filters[attribute2][]=value1&filters[attribute2][]=value2
```


## Visits ##

### Get visits (INDEX) ###
```
GET /iplacex/surveys.json
```

Example response

```
{
  "surveys": [
    {
      "id": 21,
      "survey_id": 6781,
      "entity_type": "Iplacex::Contact",
      "entity_id": 2,
      "survey_type": "pending_plus_date",
      "created_at": "2017-03-28T13:18:16.000Z",
      "updated_at": "2017-03-28T13:18:16.000Z",
      "done": false,
      "is_new": true,
      "iplacex_contacted_ids": []
    },
    {
      "id": 22,
      "survey_id": 6782,
      "entity_type": "Iplacex::Contact",
      "entity_id": 2,
      "survey_type": "new_follow_up_visit",
      "created_at": "2017-03-28T13:18:44.000Z",
      "updated_at": "2017-03-28T13:18:44.000Z",
      "done": false,
      "is_new": true,
      "iplacex_contacted_ids": []
    }
  ]
}
```

Use filters for specific cases like history, new, pending etc.

For history "done" = 1

For pending "is_new" = 0

For new     "is_new" = 1

Example: to get all new visits use
```
GET /iplacex/surveys.json?filters[is_new][]=1
```

### Possible values for survey_type and process to follow for each ###

If entity_type = "Iplacex::Contact" survey_type can be:

1. new_follow_up_visit
Start a new follow up visit on contact

2. new_close_visit
Start a new close contract visit

If entity_type = "Iplacex::Company" survey_type can be:

1. new_presentation_visit
Start new presentation visit

2. new_agreement_visit
Start new agreement visit

3. new_difusion_visit
Start new diffusion visit

4. new_followup_visit
Start new followup visit

5. new_close_visit
Start new close contract visit

### Update Visit ###
```
PUT /iplacex/surveys/<ID>.json
```
Payload
```
{
  "attribute_name": "new_value"
}
```

Special cases:

1. After completion of survey set "done" = 1
2. After a survey is opened set "is_new" = 0
3. After a company survey is completed for a given contact only but not completed for the company, append the contact id in "iplacex_contacted_ids" and update, after the survey is completed for the company set "done" = 1

## Contacts ##

### GET Contact ###

To receive a contact using ID

```
GET /iplacex/contacts/<ID>.json
```

Example response
```
{
      "id": 5,
      "hubspot_id": 11571251,
      "hubspot_company_id": 417830268,
      "created_at": "2017-03-27T07:21:16.000Z",
      "updated_at": "2017-03-28T07:38:15.000Z",
      "hs_analytics_last_url": "http://www.iplacex.cl/",
      "num_unique_conversion_events": "1",
      "hs_analytics_revenue": "0.0",
      "createdate": "1484785411888",
      "hs_analytics_first_referrer": "",
      "hs_email_optout": "",
      "hs_predictivecontactscore": "53",
      "rut": "179568012",
      "recent_conversion_event_name": "Online Carreras Técnicas Técnico en Logística | Iplacex: Solicita llamado",
      "hubspot_owner_id": "17899873",
      "first_deal_created_date": "1484854980476",
      "mobilephone": "+12063063253",
      "num_associated_deals": "1",
      "source_2": "Organic",
      "action": "pending_visit",
      "hs_analytics_num_page_views": "24",
      "hs_facebookid": "734943430",
      "hs_sales_email_last_opened": "1485080651381",
      "notes_last_updated": "1487875940858",
      "hs_predictivecontactscorebucket": "bucket_3",
      "recent_deal_close_date": "",
      "hs_ip_timezone": "america_slash_los_angeles",
      "first_conversion_date": "1484785411888",
      "ip_zipcode": "",
      "hs_analytics_average_page_views": "1",
      "lastname": "Barros",
      "num_conversion_events": "1",
      "currentlyinworkflow": "false",
      "ip_latlon": "",
      "hs_analytics_num_event_completions": "0",
      "hs_lifecyclestage_lead_date": "1484785412848",
      "sede_1": "Santiago",
      "first_conversion_event_name": "Online Carreras Técnicas Técnico en Logística | Iplacex: Solicita llamado",
      "whatsapp": "true",
      "ipaddress": "38.122.182.107",
      "associatedcompanyid": "417830268",
      "firstname": "Domingo",
      "ip_state": "california",
      "ip_country": "united states",
      "hs_social_num_broadcast_clicks": "0",
      "hs_analytics_last_timestamp": "1490188468231",
      "hs_lifecyclestage_opportunity_date": "1484854980636",
      "hs_analytics_num_visits": "16",
      "ip_state_code": "ca",
      "hs_social_linkedin_clicks": "0",
      "hs_analytics_last_visit_timestamp": "1490188468231",
      "file": "",
      "hs_social_last_engagement": "",
      "associatedcompanylastupdated": "19607776138168012",
      "create_date_2": "1484697600000",
      "hs_analytics_source": "DIRECT_TRAFFIC",
      "num_contacted_notes": "6",
      "recent_deal_amount": "",
      "hs_email_optout_1141985": "",
      "email": "djbarros@uc.cl",
      "hs_email_optout_1141983": "",
      "notes_next_activity_date": "",
      "hs_analytics_first_url": "http://www.iplacex.cl/",
      "ip_country_code": "us",
      "jobtitle": "PRUEBA PRUEBA",
      "hs_analytics_first_visit_timestamp": "1484781269986",
      "hs_analytics_first_timestamp": "1484781269986",
      "lastmodifieddate": "1490686689050",
      "photo": "https://d2ojpxxtu63wzl.cloudfront.net/static/d8c49b464762d5450ae51f3aba6fe893_b61df8cc4352cee4efd33cdaa554fadbb944cf4c3859634a17c798dd6a18bf44",
      "hs_social_google_plus_clicks": "0",
      "hs_analytics_last_referrer": "http://www.iplacex.cl/carreras-online-iplacex",
      "engagements_last_meeting_booked": "",
      "hs_social_facebook_clicks": "0",
      "hubspot_owner_assigneddate": "1484785555425",
      "ip_city": "san jose",
      "notes_last_contacted": "1485493200000",
      "hs_email_optout_1236966": "",
      "total_revenue": "",
      "recent_conversion_date": "1484785411888",
      "hs_analytics_source_data_2": "",
      "hs_social_twitter_clicks": "0",
      "carrera": "Adm. De Empresas, Mención Finanzas",
      "hs_analytics_source_data_1": "",
      "sexo": "F",
      "lifecyclestage": "opportunity",
      "hs_email_sends_since_last_engagement": "0",
      "num_notes": "9",
      "latitude": null,
      "longitude": null
    }
```

### Index contacts ####

```
GET /iplacex/contacts.json
```

Renders a list of contacts

* will render 20 records per page
* use params "page" to get new page, 
* to get contacts for a list if ids use params "contact_ids"
* use filter syntax to filter on any attributes

```
to get contacts for a list of ids
GET /iplacex/contacts?contact_ids[]=<ID>&contact_ids[]=<ID>
```

### Update contacts ###
```
PUT /iplacex/contacts/<ID>.json
```
Update a contact record with id

Sample Payload

```
{
  "attribute_name": "new_value",
  "attribute_name": "new_value"
  .....
  .....
  .....
}
```

Response
```
Status = 200 , Body = Empty
```

## Company ##

### Index Companies ###

```
GET /iplacex/companies.json
```

Example response

```
{
  "companies": [
    {
      "id": 3,
      "hubspot_company_id": 417830268,
      "created_at": "2017-03-27T05:58:19.000Z",
      "updated_at": "2017-03-27T09:43:43.000Z",
      "country": "United States",
      "webhook": "4",
      "city": "Palo Alto",
      "num_associated_contacts": "1",
      "timezone": "America/Los_Angeles",
      "facebook_company_page": "https://facebook.com/zinier",
      "createdate": "1490160769247",
      "description": "ZINIER is a cloud-based platform helping enterprises efficiently track and manage ground operations and communicate effectively with a large, dispersed workforce.",
      "hs_analytics_last_timestamp": "1490188468231",
      "hs_analytics_num_visits": "16",
      "linkedin_company_page": "https://www.linkedin.com/company/zinier-inc",
      "recent_conversion_event_name": "Online Carreras Técnicas Técnico en Logística | Iplacex: Solicita llamado",
      "hs_analytics_last_visit_timestamp": "1490188468231",
      "hubspot_owner_id": "17899873",
      "hs_analytics_source": "DIRECT_TRAFFIC",
      "num_contacted_notes": "6",
      "founded_year": "2014",
      "action": "new_presentation_visit",
      "hs_analytics_num_page_views": "24",
      "state": "CA",
      "contact_first_name": "Domingo Barros",
      "linkedinbio": "ZINIER is a cloud-based platform helping enterprises efficiently track and manage ground operations and communicate effectively with a large, dispersed workforce.",
      "notes_next_activity_date": "",
      "zip": "94304",
      "notes_last_updated": "1485476381513",
      "website": "zinier.com",
      "address": "2627 Hanover Street",
      "hs_analytics_first_visit_timestamp": "1484781269986",
      "hs_analytics_first_timestamp": "1484781269986",
      "first_conversion_date": "1484785411888",
      "engagements_last_meeting_booked": "",
      "first_contact_createdate": "1484785411888",
      "twitterhandle": "zinierinc",
      "hs_lastmodifieddate": "1490607819183",
      "hubspot_owner_assigneddate": "1490160769247",
      "notes_last_contacted": "1485493200000",
      "num_conversion_events": "1",
      "domain": "zinier.com",
      "is_public": "false",
      "name": "ZINIER, INC.",
      "recent_conversion_date": "1484785411888",
      "hs_analytics_source_data_2": "",
      "hs_analytics_source_data_1": "",
      "first_conversion_event_name": "Online Carreras Técnicas Técnico en Logística | Iplacex: Solicita llamado",
      "num_notes": "7",
      "zinier_village": "Las Condes",
      "zinier_contact_name": "Domingo Barros",
      "zinier_street": "callao",
      "zinier_contact_last_name": "Barros",
      "zinier_contact_phone": "+1 206 306 3253",
      "zinier_region": "Region Metropolitana",
      "zinier_observations": "Cool Company",
      "zinier_city": "santiago",
      "latitude": null,
      "longitude": null
    }
  ]
}
```

* Use filters to filter by any attribute.

### Update Company ###

```
PUT /iplacex/companies/<ID>.json
```

Payload

```
{
  "attribute_name": "new_value"
}
```

Response

```
status = 200, body = empty
```

### GET company ###

Receive one company based on ID

```
GET /iplacex/companies/<ID>.json
```

Sample response

```
{
      "id": 3,
      "hubspot_company_id": 417830268,
      "created_at": "2017-03-27T05:58:19.000Z",
      "updated_at": "2017-03-27T09:43:43.000Z",
      "country": "United States",
      "webhook": "4",
      "city": "Palo Alto",
      "num_associated_contacts": "1",
      "timezone": "America/Los_Angeles",
      "facebook_company_page": "https://facebook.com/zinier",
      "createdate": "1490160769247",
      "description": "ZINIER is a cloud-based platform helping enterprises efficiently track and manage ground operations and communicate effectively with a large, dispersed workforce.",
      "hs_analytics_last_timestamp": "1490188468231",
      "hs_analytics_num_visits": "16",
      "linkedin_company_page": "https://www.linkedin.com/company/zinier-inc",
      "recent_conversion_event_name": "Online Carreras Técnicas Técnico en Logística | Iplacex: Solicita llamado",
      "hs_analytics_last_visit_timestamp": "1490188468231",
      "hubspot_owner_id": "17899873",
      "hs_analytics_source": "DIRECT_TRAFFIC",
      "num_contacted_notes": "6",
      "founded_year": "2014",
      "action": "new_presentation_visit",
      "hs_analytics_num_page_views": "24",
      "state": "CA",
      "contact_first_name": "Domingo Barros",
      "linkedinbio": "ZINIER is a cloud-based platform helping enterprises efficiently track and manage ground operations and communicate effectively with a large, dispersed workforce.",
      "notes_next_activity_date": "",
      "zip": "94304",
      "notes_last_updated": "1485476381513",
      "website": "zinier.com",
      "address": "2627 Hanover Street",
      "hs_analytics_first_visit_timestamp": "1484781269986",
      "hs_analytics_first_timestamp": "1484781269986",
      "first_conversion_date": "1484785411888",
      "engagements_last_meeting_booked": "",
      "first_contact_createdate": "1484785411888",
      "twitterhandle": "zinierinc",
      "hs_lastmodifieddate": "1490607819183",
      "hubspot_owner_assigneddate": "1490160769247",
      "notes_last_contacted": "1485493200000",
      "num_conversion_events": "1",
      "domain": "zinier.com",
      "is_public": "false",
      "name": "ZINIER, INC.",
      "recent_conversion_date": "1484785411888",
      "hs_analytics_source_data_2": "",
      "hs_analytics_source_data_1": "",
      "first_conversion_event_name": "Online Carreras Técnicas Técnico en Logística | Iplacex: Solicita llamado",
      "num_notes": "7",
      "zinier_village": "Las Condes",
      "zinier_contact_name": "Domingo Barros",
      "zinier_street": "callao",
      "zinier_contact_last_name": "Barros",
      "zinier_contact_phone": "+1 206 306 3253",
      "zinier_region": "Region Metropolitana",
      "zinier_observations": "Cool Company",
      "zinier_city": "santiago",
      "latitude": null,
      "longitude": null
    }
```
