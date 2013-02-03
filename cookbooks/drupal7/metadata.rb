name              "drupal7"
maintainer        "mparker17"
maintainer_email  "mparker17@536298.no-reply.drupal.org"
license           "GPL-2"
description       "A simple way to get Drupal 7 up and running fast."
version           "0.0.1"

recipe            "drupal7", "Main Drupal7 configuration."

%w{ubuntu}.each do |os|
  supports os
end

