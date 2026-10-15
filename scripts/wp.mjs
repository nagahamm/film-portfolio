#!/usr/bin/env node
// ==========================================================
// Local のサイトに対して WP-CLI を実行する。
// Local の「Site shell」を開かずに使えるよう、Local の sites.json から
// このサイトを探し、Local 同梱の PHP・WP-CLI・MySQL を直接呼ぶ。
//
//   node scripts/wp.mjs <WP-CLI の引数>     例: node scripts/wp.mjs post list
// ==========================================================
import { readFileSync, readdirSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import { homedir } from 'node:os';
import { join } from 'node:path';

const DOMAIN = 'film-portfolio.local';
const LOCAL = join(homedir(), 'Library/Application Support/Local');
const WP_CLI = '/Applications/Local.app/Contents/Resources/extraResources/bin/wp-cli/wp-cli.phar';

const sites = JSON.parse(readFileSync(join(LOCAL, 'sites.json'), 'utf8'));
const [id, site] = Object.entries(sites).find(([, s]) => s.domain === DOMAIN) ?? [];
if (!site) {
  console.error(`✗ Local に ${DOMAIN} のサイトが見つからない`);
  process.exit(1);
}

// lightning-services/<名前>-<版>+<連番>/bin/darwin-arm64/bin
const bin = (name) => {
  const dir = readdirSync(join(LOCAL, 'lightning-services'))
    .find((d) => d.startsWith(`${name}-${site.services[name].version}+`));
  return join(LOCAL, 'lightning-services', dir, 'bin/darwin-arm64/bin');
};
const socket = join(LOCAL, 'run', id, 'mysql/mysqld.sock');

const { status } = spawnSync(
  join(bin('php'), 'php'),
  ['-d', `mysqli.default_socket=${socket}`, '-d', 'error_reporting=E_ALL&~E_DEPRECATED', WP_CLI, ...process.argv.slice(2)],
  {
    cwd: join(site.path.replace(/^~/, homedir()), 'app/public'),
    stdio: 'inherit',
    // mysqldump などの MySQL クライアント(wp db export 等)にも同じソケットを使わせる
    env: { ...process.env, PATH: `${bin('mysql')}:${process.env.PATH}`, MYSQL_UNIX_PORT: socket },
  },
);
process.exit(status ?? 1);
