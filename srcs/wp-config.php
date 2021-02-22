<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'kevin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'rS@z[p%HdV17]-wjbwqJ.eecwf.V1r/x$ln+>#a/:Bgr8m!)ONwm<{7:`$^Sj+ZC');
define('SECURE_AUTH_KEY',  'M#A|4=&F}0M|( wtSX+MX?e!;CrJ.W Scy$d^~GLXB=dkJ{8; m!_]kuXz-w`eY=');
define('LOGGED_IN_KEY',    'B5Ud-^A[)Y6D2!M6U>%qg|(Y<g7CT;h!/S_?tFo*Re1?kBj[W{[>*);hBNY-OG0V');
define('NONCE_KEY',        'K7I*$Fu3N>1^c0+/SS0k dvK+K&7jfSp6;qSJ*Ta-s]]g.y8i{su#3i~){fa+#?,');
define('AUTH_SALT',        '.J=p+r^}Z6S-G>K+3lFO5iNbL3--To^gj02liHeHfz-B|YI@1@b&m<ZhokyZ-j}{');
define('SECURE_AUTH_SALT', '(S1glsmh|{V9Dy9hNdY^lENM=cj^yhQGWi#MHnVp0E-/48}Md|O1G#LY=|9H.U$L');
define('LOGGED_IN_SALT',   'F5%r*I,`z-YX*A7~ TuwI[y4o7pY0*/v;LVPZl*R^P6[P~f;Z*v2*-V8|b<j^5c9');
define('NONCE_SALT',       'pE}U2tB%D5OA26P/=}AWy 0bbdTk66>sNu2w+k|7~#TU~dpL=0L(2OyNip9Wg-(G');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
