# Random Archival Object Creator

Bash script for creating randomly named Archival Objects in an ArchivesSpace repository.  The script was developed to automate the created of Archival Objects for use in performing Test synchronizations between systems.  To use set the values in `aspace.properties` for your system:

```bash
DEV_USER=username
DEV_PASS=password
DEV_URL=https://archivesspace.url/api/
DEV_REPO=/repositories/number/
DEV_RESOURCE=resources/number
```

Several helper calls are included and commented out that list the repository numbers and resource numbers.

```bash
#############################################
# Helper calls
# comment out last create command and uncomment each below to get values for
# list of repos and resoruces in the repo, set these in aspace.properties
#############################################

## get list of repositories
curl -H "X-ArchivesSpace-Session: ${SESSION}" "${URL}repositories"

## get list of resouces
curl -H "X-ArchivesSpace-Session: $SESSION" "${URL}repositories/17/resources?page=1&page_size=10"

```









#### Contact:

David Cirella  
[github.com/decirella](https://github.com/decirella)
