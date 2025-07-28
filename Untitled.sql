   CREATE OR REPLACE API INTEGRATION GM_API_GITHUB_INTEGRATION
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/')
  ALLOWED_AUTHENTICATION_SECRETS = (GM_SF_DBT_PROJECT_DEMO_LANDING_DB.RAW.GM_PS_GITHUB) 
   ENABLED = TRUE;

CREATE OR REPLACE NETWORK RULE GM_SF_DBT_PROJECT_DEMO_LANDING_DB.public.dbt_network_rule
  MODE = EGRESS
  TYPE = HOST_PORT
  VALUE_LIST = ('hub.getdbt.com', 'codeload.github.com');

CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION gm_dbt_access_integration
  ALLOWED_NETWORK_RULES = (GM_SF_DBT_PROJECT_DEMO_LANDING_DB.public.dbt_network_rule)
  ENABLED = true;

  grant usage on integration gm_dbt_access_integration to role dev_arf_sc_data_engineer;
  grant usage on integration gm_dbt_access_integration to role dev_arf_gcc_data_engineer;