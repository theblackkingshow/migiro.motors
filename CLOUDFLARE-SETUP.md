# Cloudflare setup for migiromotors.com.au

## Fastest path

1. Log in to Cloudflare
2. Add `migiromotors.com.au`
3. Change the registrar nameservers to the ones Cloudflare gives you
4. Run:

```bash
cd /home/donasher_47/mark.aussie
chmod +x deploy-to-cloudflare.sh
./deploy-to-cloudflare.sh
```

5. In Cloudflare Pages, attach the custom domain:
   - `migiromotors.com.au`
   - `www.migiromotors.com.au`

## Temporary live links

- `https://79b4a4915a9ccf.lhr.life`
- `https://oolml-102-0-7-24.run.pinggy-free.link`
