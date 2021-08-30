#!/usr/bin/env python3

import yaml
import os

with open('/data/config.yaml', 'r+') as f:
    data = yaml.load(f, Loader=yaml.FullLoader)
    data["plugins"]["mqtt"]["broker"]["url"] = os.environ["MQTT_BROKER"]
    data["plugins"]["auth_ldap"]["uri"] = os.environ["LDAP_URI"]
    data["plugins"]["auth_ldap"]["auth_user"] = os.environ["LDAP_ADMIN_USER"]
    data["plugins"]["auth_ldap"]["auth_password"] = os.environ["LDAP_ADMIN_PASS"]
    data["plugins"]["auth_ldap"]["search_base"] = os.environ["LDAP_SEARCH_BASE"]
    data["plugins"]["auth_ldap"]["ou"] = os.environ["LDAP_OU"]
    data["apperance"]["name"] = os.environ["PRINTER_NAME"]
    data["apperance"]["color"] = os.environ["PRINTER_COLOR"]
    
    f.seek(0)
    f.write(yaml.dump(data, default_flow_style=False))
    f.truncate()
