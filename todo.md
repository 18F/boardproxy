
## Further controls

Some actions might be filterable at the URL request level. Such as:

DONE: Board creation `POST /1/boards` 

But things like: `POST 1/boards/5c8acc11bc371f1558970c98/markAsViewed` is OK

DONE Team creation: `POST /1/organizations`

EXPERIMENTAL: Limit viewing other boards. Boards are all `b/BrdCodeX/board-readable-name` for direct linking, all GETs for viewing boards are `/1/Boards/BrdCodeX?params&...`

WAS WORKING, BUT NOW maybe POSSIBLE TO ADD POWERUPS: Adding PowerUps needs these two calls:

```text 
GET https://trello.app.cloud.gov/b/5.../pe....te/power-ups
POST https://trello.app.cloud.gov/1/boards/5c8ac....57b/boardPlugins
```

Viewing members is probably OK. There are different links. The one with email address give json, e.g.:
https://trello.com/1/members/peter.burkholder@agency.gov

The one with the user _name_ provides a UI, e.g: https://trello.com/peteragencyburkholder
