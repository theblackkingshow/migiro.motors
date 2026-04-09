# Live deployment and authentication

## Current public live URL

- Free live preview: `https://wrpzi-102-0-7-24.run.pinggy-free.link`
- Local URL: `http://127.0.0.1:8000`

## Upgrade to authenticated Pinggy Pro

1. Go to `https://dashboard.pinggy.io/`
2. Upgrade your account to Pro
3. Copy your access token from the dashboard
4. Run:

```bash
cd /home/donasher_47/mark.aussie
chmod +x publish-live.sh
PINGGY_TOKEN=YOUR_TOKEN ./publish-live.sh
```

Or directly with SSH:

```bash
ssh -p 443 -R0:localhost:8000 YOUR_TOKEN@pro.pinggy.io
```

## What authentication gives you

- persistent subdomain
- authenticated Pro tunnel
- better long-running reliability
- support for custom domain mapping

## Recommended domain

- `migiromotors.com.au`

## SQL file included

- `schema.sql`
