#!/bin/bash

bundle install
gem build pdf_extractor.gemspec
gem install pdf_extractor-${CI_COMMIT_TAG}.gem
gem nexus pdf_extractor-${CI_COMMIT_TAG}.gem --url https://nexus.eman.cz/repository/eman-gems/ --credential "$NEXUS_USER:$NEXUS_PASSWORD"
