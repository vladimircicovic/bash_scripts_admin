set +H
{
xmlstr='<?xml version="1.0"?>
<config>
    <global>
        <install>
            <date><![CDATA[Tue, 11 Dec 2012 12:31:25 +0000]]></date>
        </install>
        <crypt>
            <key><![CDATA[70e75d7969b900b696785f2f81ecb430]]></key>
        </crypt>
        <disable_local_modules>false</disable_local_modules>
        <resources>
            <db>
                <table_prefix><![CDATA[]]></table_prefix>
            </db>
            <default_setup>
                <connection>
                    <host><![CDATA[localhost]]></host>
                    <username><![CDATA[root]]></username>
                    <password>pass123</password>
                    <dbname><![CDATA[testdb]]></dbname>
                    <initStatements><![CDATA[SET NAMES utf8]]></initStatements>
                    <model><![CDATA[mysql4]]></model>
                    <type><![CDATA[pdo_mysql]]></type>
                    <pdoType><![CDATA[]]></pdoType>
                    <active>1</active>
                </connection>
            </default_setup>
        </resources>
        <session_save><![CDATA[files]]></session_save>
    </global>
    <admin>
        <routers>
            <adminhtml>
                <args>
                    <frontName><![CDATA[admin]]></frontName>
                </args>
            </adminhtml>
        </routers>
    </admin>
</config>
'

# exec issue
#exec 3<&- 3<<<"$xmlstr"
#exec 3<&- 3< <(printf '%s' "$xmlstr")
exec 3<&- 3<<EOF
$(printf '%s' "$xmlstr")
EOF

{ read -r host; read -r username; read -r password; read -r dbname; } < <(
       echo "cat /config/global/resources/default_setup/connection/*[self::host or self::username or self::password or self::dbname]/text()" | 
          xmllint --nocdata --shell /dev/fd/3 | 
          sed -e '1d;$d' -e '/^ *--* *$/d'
       )

printf '%s\n' "host: $host" "username: $username" "password: $password" "dbname: $dbname"

exec 3<&-
}
set -H
