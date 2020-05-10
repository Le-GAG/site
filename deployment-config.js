const process = require('process');

function chownToDaemonDocker (context) {
  return [ `chown -R daemon:docker ${context.release.path}` ];
}

module.exports = function (options) {
  return {
    common: {
      currentReleaseLink: 'current',
      host:               'yohann-bianchi.ovh',
      mode:               'synchronize',
      releasesToKeep:     10,
    },

    // Environment specific configuration
    environments: {
      api_preprod: {
        host:          'yohann-bianchi.ovh',
        username:      'root',
        agent:         process.env.SSH_AUTH_SOCK,
        localPath:     'api/core',
        deployPath:    '/srv/htdocs/api.backend.gag.preprod.yohann-bianchi.ovh',
        share:         {
          'logs':       'logs',
          'uploads':    'public/uploads',
          'config.php': 'config/api.php',
        },
        exclude:       [
          'public/uploads',
          'public/uploads/**',
          'logs',
          'logs/**',
          'config/*.php',
          '.github',
          '.github/**',
          '.git',
          '.git/**',
          'node_modules',
          'node_modules/**',
        ],
        onAfterDeploy: chownToDaemonDocker,
      },

      app_preprod: {
        host:       'yohann-bianchi.ovh',
        username:   'root',
        agent:      process.env.SSH_AUTH_SOCK,
        localPath:  'app/dist',
        deployPath: '/srv/htdocs/app.backend.gag.preprod.yohann-bianchi.ovh',
      },
    },
  };
};
