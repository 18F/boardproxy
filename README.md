# BoardProxy

Proxies traffic to https://trello.com via https://trello.app.cloud.gov

## Usage

To deploy the app:

```sh
cf push --vars-file prod_var.yml
```

Navigate to: https://trello.app.cloud.gov/b/fATOinWT/fema-ocio-ei-no-pii-or-cui

## Authentication

None. Filters based on ingress IP address.

## Testing

Testing requires a `bash` shell and local install of `docker-compose`, `bats` (preferably `bats-core` on MacOS) and `httpie`. Run with:

```sh
./runtest.sh
```

## Recommended settings

Create a `private` board. Private boards can't be changed to other privacy settings except by admins, initially the board creator

Disable member invites, and allow only admins to invite new members. Go to `More` ... `Settings` ... `Add/Remove Permissions` and set to Admin only.

Make sure most users are Normal (the default). There are two permissions levels: Admin and Normal. Invitees are normal. Normal is described as: 
> Can view and edit cards. Can change some board settings.

A Normal user can view privacy settings (private, team, public, ...), but not change them.

## Further controls

Some actions might be filterable at the URL request level. Such as:

Board creation `POST /1/boards` 

But things like: `POST 1/boards/5c8acc11bc371f1558970c98/markAsViewed` is OK

Team creation: `POST /1/organizations`

Adding PowerUps needs these two calls:

```text 
GET https://trello.app.cloud.gov/b/5.../pe....te/power-ups
POST https://trello.app.cloud.gov/1/boards/5c8ac....57b/boardPlugins
```

Viewing members is probably OK. There are different links. The one with email address give json, e.g.:
https://trello.com/1/members/peter.burkholder@agency.gov

The one with the user _name_ provides a UI, e.g: https://trello.com/peteragencyburkholder

Viewing other boards. Boards are all `b/boardcode/board-readable-name`. 
