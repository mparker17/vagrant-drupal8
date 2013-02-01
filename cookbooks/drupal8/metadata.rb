name              "drupal8"
maintainer        "mparker17"
maintainer_email  "mparker17@536298.no-reply.drupal.org"
license           "GPL-2"
description       "A simple way to get Drupal 8 up and running fast."
version           "0.0.1"

recipe            "drupal8", "Main Drupal8 configuration."

%w{ubuntu}.each do |os|
  supports os
end

