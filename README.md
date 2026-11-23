## Struttura delle datadir (cartella Data/, esclusa da git)

I percorsi host vengono da DockerImages/.env e sono montati come bindmount in compose.yaml.

```
Data/
├── DbData/                 -> ${DBDATA}       montata in  /var/lib/postgresql   (container database)
│   └── 19/docker/          dati del cluster Postgres 19 (creata al primo avvio: da pg 18 in poi
│                           l'immagine salva i dati in /var/lib/postgresql/<versione>/docker)
│
└── OdooData/
    ├── dataDir/            -> ${ODOODATA}      montata in  /var/lib/odoo         (container odoo)
    │                       filestore/<nome_db>  allegati e file caricati
    │                       sessions/            sessioni web degli utenti
    ├── addons/             -> ${O_MODULES_DIR} montata in  /mnt/extra-addons     moduli personalizzati
    └── config/             -> ${O_CONFIG_DIR}  montata in  /etc/odoo             contiene odoo.conf
```

## Struttura .env
BASEPATH= Path della Directory Data 

ODOODATA=${BASEPATH}/OdooData

ODOO_DATA_DIR=${ODOODATA}/dataDir
O_MODULES_DIR=${ODOODATA}/modules
O_CONFIG_DIR=${ODOODATA}/config

DBDATA=${BASEPATH}/DbData
DB_USER=
DB_PASSWORD=


