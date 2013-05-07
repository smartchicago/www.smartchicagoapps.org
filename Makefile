# STAGING_BUCKET    = s3://cutgroup-staging.smartchicagoapps.org/
PRODUCTION_BUCKET = s3://www.smartchicagoapps.org/

S3CMD = s3cmd -c .s3cfg \
	--acl-public \
	--no-delete-removed \
	--reduced-redundancy \
	--progress \
	--rexclude '\.git|s3cfg|Makefile|signups.json|.DS_Store' \
	sync ./_site/

all: deploy

deploy:
	$(S3CMD) $(PRODUCTION_BUCKET)

# staging:
# 	$(S3CMD) $(STAGING_BUCKET)
# 
# minify:
# 	uglifyjs assets/js/main.js -c -o assets/js/main-min.js
