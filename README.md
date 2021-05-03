# WeOS CRM
Open Source Customer Relationship Manager that is about ... well managing Customer Relationships. A number of current CRM solutions tend to cater to sales teams with functionality
that really belongs in a lead management tool. On the other end of the spectrum there are a number of Customer Support tools
that focus on ticket creation rather than focusing on customer relationships. WeOS CRM aims to put the focus back on the customer

## Getting Started

There are two ways to get started with WeOS CRM:

1. Setup WeOS CRM on your own machine (WeOS CRM App)
1. Start with a free account on WeOS (WeOS CRM Cloud)

## WeOS CRM App

### Quick Start
1. Download the latest release `wget https://github.com/wepala/weos-crm/releases`
1. Unzip the contents of the latest release  `unzip weos-crm-macos.zip`
1. Open the folder with the application `cd weos-crm`
1. Run the application `weos-crm` in terminal e.g. `./weos-crm` (the default port is 8681 but you can run on a different port by specifying `port` argument e.g.  `-port=80`)
1. Go to localhost in your browser `http://localhost:8681`

### Configuration

The application can be configured by editing the `api.yaml` and restarting the app. The config can be used to manage:

1. The database used (sqlite, mysql, postgresql, mssql, clickhouse are supported)
1. The api that the application uses. API endpoints can be added,renamed, removed etc.

### Advanced Configuration

You can change the functionality of the app by forking the repository and editing the different components of the app

1. The app (i.e. adding more handlers to be able to enhance the functionality of the api)
1. The module(s). WeOS apps are driven by one or more modules. You can fork the module repo and make changes to the business logic
1. User Interface(s). WeOS apps provide one or more user interfaces. These interfaces live in their own repositories and can be forked and edited



