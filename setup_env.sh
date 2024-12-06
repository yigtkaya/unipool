#!/bin/bash

# Create secrets.xml from template
cat > android/app/src/main/res/values/secrets.xml << EOL
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="maps_api_key">${ANDROID_MAPS_API_KEY}</string>
</resources>
EOL

# Create Configuration.swift from template
cat > ios/Runner/Configuration.swift << EOL
enum Configuration {
    static let mapsApiKey: String = "${IOS_MAPS_API_KEY}"
}
EOL 