# agi_grundbuchplan_20190510
Modell für Grundbuchplan-Zusatz-Tabellen.

Vier zusätzliche Tabellen, die für die korrekte Darstellung des Plans für das Grundbuch benötigt werden.

## Entwicklung
Es wird eine lokale Vagrant-Maschine mit einer DB (`pub`) verwendet. Mit dem GRETL-Dockerimage werden die Daten umgebaut und transferiert.

### ili2pg
```
java -jar /Users/stefan/apps/ili2pg-4.1.0/ili2pg-4.1.0.jar \
--dbschema agi_grundbuchplan_pub --models SO_AGI_Grundbuchplan_20190510 --modeldir ".;http://models.geo.admin.ch" \
--defaultSrsCode 2056 --createGeomIdx --createFk --createFkIdx --createEnumTabs --beautifyEnumDispName --createMetaInfo --createNumChecks --nameByTopic --strokeArcs \
--createscript agi_grundbuchplan_pub_20190510.sql
```

## GRETL-Job
Branch `grundbuchplan`.

```
export DB_URI_SOGIS=jdbc:postgresql://geodb.verw.rootso.org:5432/sogis
export DB_USER_SOGIS=bjsvwzie
export DB_PWD_SOGIS=fubar

export DB_URI_PUB=jdbc:postgresql://192.168.50.8:5432/edit
export DB_USER_PUB=ddluser
export DB_PWD_PUB=ddluser

./scripts/start-gretl.sh --docker-image sogis/gretl-runtime:production --job-directory /Users/stefan/sources/gretljobs_agi_mopublic_new_data_import/agi_mopublic_pub/
```

Bemerkungen: Die Tabellen im Schema `av_pfdgb` werden während des NG-Importprozesses gemeindeweise abgefüllt. Die Queries dazu sind in einer lookup-Tabelle im gleichen Schema. Muss via Staging-Schema in der Edit-DB mit SQL-Executor gemacht werden. Anschliessend db2db in die Pub-DB.

