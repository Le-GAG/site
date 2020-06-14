const process = require('process');

function chownToDaemonDocker (context) {
  return [ `chown -R daemon:docker ${context.release.path}` ];
}

module.exports = function (options) {
  return {
    common: {
      currentReleaseLink: 'current',
      host:               'le-gag.fr',
      username:           'root',
      agent:              process.env.SSH_AUTH_SOCK,
      mode:               'synchronize',
      releasesToKeep:     3,
    },

    // Environment specific configuration
    environments: {
      api_preproduction: {
        localPath:     'api/core',
        deployPath:    '/srv/htdocs/api.preprod.le-gag.fr',
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

      app_preproduction: {
        localPath:  'app/dist',
        deployPath: '/srv/htdocs/backend.preprod.le-gag.fr',
      },

      frontend_preproduction: {
        localPath:  'frontend/dist',
        deployPath: '/srv/htdocs/preprod.le-gag.fr',
      },
    },
  };
};
