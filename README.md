# mushbox-belaui-branding

A small visual patch that adds the Mushbox logo/header to [belaUI](https://github.com/BELABOX/belaUI), the local web interface used by BELABOX encoders.

This is **not** an official BELABOX project and isn't affiliated with or endorsed by the BELABOX team. It's a cosmetic patch applied on top of the stock belaUI install — no streaming logic, encoder behavior, or core functionality is touched. Only `index.html` and `style.css` are modified (one new header block + a few CSS rules), plus one new image file.

## What it does

Adds a branded header bar to the top of the belaUI page, visible on the login screen, initial setup screen, and the main control screen.

## Install

On a Rock 5A (or any device) already running belaUI:

```bash
curl -sL https://raw.githubusercontent.com/mushr00msauce/mushbox-belaui-branding/main/install.sh | sudo bash
```

This backs up your existing `index.html` and `style.css` (only on the first run — re-running is safe and won't overwrite the backup) before applying the patch.

## Revert

```bash
sudo cp /opt/belaUI/public/index.html.bak /opt/belaUI/public/index.html
sudo cp /opt/belaUI/public/style.css.bak /opt/belaUI/public/style.css
```

## License

belaUI itself is licensed under [GPL-3.0](https://github.com/BELABOX/belaUI/blob/main/LICENSE) by the BELABOX project. This repo contains a modified `index.html` and `style.css` derived from that project, distributed under the same GPL-3.0 license. The Mushbox logo (`img/mushbox-logo.png`) is Mushbox's own trademark/artwork and is not covered by the GPL — it's included here only as the asset this patch installs.

See the original, unmodified belaUI project at [github.com/BELABOX/belaUI](https://github.com/BELABOX/belaUI).
