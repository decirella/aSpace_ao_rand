#!/bin/bash



#Read in values from properties file
credsfile="aspace.properties"

while IFS== read -r VAR1 VAR2
do
    #echo "VAR1=$VAR1 : VAR2=$VAR2"
    export "$VAR1=$VAR2"
done < $credsfile


USER="$DEV_USER"
PASS="$DEV_PASS"

URL="$DEV_URL"

# dps repo
REPO="$DEV_REPO"

# TestAVPackagerSyncs "uri":"/repositories/17/resources/12041"
RESOURCE="$DEV_RESOURCE"


RANDSTRING=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 8 ; echo '')
echo $RANDSTRING

# get token, filter for session, remove double quotes with tr
SESSION=$(curl -s -F password=$PASS -X POST  "${URL}users/${USER}/login" | jq '.session' | tr -d '"' )

echo "Session ${SESSION}"


#############################################
# Helper calls
# comment out last create command and uncomment each below to get values for
# list of repos and resoruces in the repo, set these in aspace.properties
#############################################

## get list of repositories
# curl -H "X-ArchivesSpace-Session: ${SESSION}" "${URL}repositories"

## get list of resouces
# curl -H "X-ArchivesSpace-Session: $SESSION" "${URL}repositories/17/resources?page=1&page_size=10"


#Create an Archival Object

curl -H "X-ArchivesSpace-Session: $SESSION" -d "{ \"jsonmodel_type\":\"archival_object\",\"external_ids\":[],\"subjects\":[],\"linked_events\":[],\"extents\":[],\"lang_materials\":[],\"dates\":[],
\"external_documents\":[],\"rights_statements\":[],\"linked_agents\":[],\"is_slug_auto\":true,\"restrictions_apply\":false,\"ancestors\":[],\"instances\":[],\"notes\":[],\"ref_id\":\"\",\"level\":\"item\",\"title\":\"${RANDSTRING} AO\",\"resource\":{ \"ref\":\"${REPO}${RESOURCE}\"}}" "${URL}${REPO}archival_objects"
