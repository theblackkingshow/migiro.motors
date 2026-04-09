# Migiro Motors — 2 Manager Setup

Use this when two people need to manage the website and stock.

## Netlify setup

1. Open your Netlify site dashboard.
2. Go to **Identity** → click **Enable Identity**.
3. Go to **Identity** → **Services** → enable **Git Gateway**.
4. Go to **Identity** → **Invite users**.
5. Invite both manager email addresses.
6. Each person accepts the email invite.
7. Both can then open:

```txt
https://your-site-name.netlify.app/admin/
```

## How it works

- Stock is managed in `data/inventory.json`
- Website enquiries go to Netlify Forms
- Editorial workflow is enabled so updates are safer for shared management

## Daily use

- Add/edit cars in the admin panel
- Mark sold cars as `sold`
- Publish changes to update the live website
