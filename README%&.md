Testing


<script>javascript:alert('XSS!')[CLICK ME]</script>

```mermaid

sequenceDiagram

Note over Client,Backend: [1] Client <-> Backend

Note over Client,Backend: [1.1] Authenticate

Note over Client,Backend: [1.1.1] At FemsServer

Client ->>+ Backend: session_id authentication
Backend ->>+ Odoo: [1.1.1.1] /fems/info?
Odoo -->> Backend: [1.1.1.2] On success
Odoo -->>- Backend: [1.1.1.2] On error
Backend --> Backend: is FEMS online?
Backend ->>- Client: [1.1.1.4] authenticate allow, metadata


Note over Client,Backend: [1.1.2] At OpenEMS

Client ->>+ Backend: [1.1.2.1] authenticate
Backend ->>- Client: [1.1.2.2] authenticate: allow, metadata

Note over Client,Backend: [1.2] Current data

Client ->>+ Backend: [1.2.1] subscribe: channels
Backend ->>+ Backend: [1.2.2] forward to OpenEMS: subscribe: channels
loop
    Backend -->>+ Backend: [1.2.3] from OpenEMS: currentdata
    Backend -->>+ Client: [1.2.4] currentdata
end

Client ->>- Backend: [1.2.5] subscribe: false
Backend ->>- Backend: forward to OpenEMS: subscribe: false

Note over Client,Backend: [1.3] Notification
Backend ->> Client: [1.3.1] notification

Note over Client,Backend: [1.4] Historic data
Client ->>+ Backend: [1.4.1] query
Backend ->>+ InfluxDB: query
InfluxDB ->>- Backend: 
Backend ->>- Client: [1.4.2] queryreply

Note over Client,Backend: [1.5] Configuration
Client ->>+ Backend: [1.5.1] config update
Client ->> Backend: [1.5.2] config create
Client ->> Backend: [1.5.3] config delete
Backend ->>- Client: [1.5.4] metadata, notification

Note over Client,Backend: [1.6] System
Client ->> Backend: [1.6.1] mode, service

Note over OpenEMS,FemsServer: [2] OpenEMS <-> FemsServer

Note over OpenEMS,FemsServer: [2.1] Authenticate
OpenEMS ->> FemsServer: [2.1.1] handshake authentication
OpenEMS ->> FemsServer: [2.1.2] metadata

Note over OpenEMS,FemsServer: [2.2] timestamped data
loop
    OpenEMS ->>+ FemsServer: [2.2.1] timedata
    FemsServer ->> InfluxDB: [data]
    FemsServer ->>- Odoo: [some data]
end
```
