# BoardProxy

Proxies traffic to https://trello.com via https://_appname_.app.cloud.gov

## Usage

After cloning this repo, update `prod_var.yml` to name your app in cloud.gov

To deploy the app:

```sh
cf push --vars-file prod_var.yml
```

Navigate to: https://_appname_.app.cloud.gov/ and login to Trello

## Sign up

New users can sign up with their agency email address, but they'll need to copy the `confirmation link` and change `trello.com` to `_appname_.app.cloud.gov`

## Authentication

None. Filters based on ingress IP address (if configured)

## Limiting access to certain boards

See the `nginx.conf` setup marked `EXPERIMENTAL`

## Testing

Testing requires a `bash` shell and local install of `docker-compose`, `bats` (preferably `bats-core` on MacOS) and `httpie`. Run with:

```sh
./runtest.sh
```

## Recommended Trello board settings

Create a `private` board. Private boards can't be changed to other privacy settings except by admins, initially the board creator

Disable member invites, and allow only admins to invite new members. Go to `More` ... `Settings` ... `Add/Remove Permissions` and set to Admin only.

Make sure most users are Normal (the default). There are two permissions levels: Admin and Normal. Invitees are normal. Normal is described as: 
> Can view and edit cards. Can change some board settings.

A Normal user can view privacy settings (private, team, public, ...), but not change them.