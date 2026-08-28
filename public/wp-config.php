<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'local' );

/** Database username */
define( 'DB_USER', 'root' );

/** Database password */
define( 'DB_PASSWORD', 'root' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'G(D@x.kk-]M8+qgkCk)RDf?Ey3>b$MMT[2v_MV4?14C?w,=:6@Eix=X[/Ha#cYwn' );
define( 'SECURE_AUTH_KEY',   '~Ft.3P:yc^62Nh hM|v_w(DDYR~bsL$Y,%Tu%dk6NF7WOGz[jc/~*W;d[;4q`TQg' );
define( 'LOGGED_IN_KEY',     ']xXS^n< 3+cCBVp7D$)!aj{%-Sw%*p:lOS(yC(rWzS}BNaWRb#do57Fb3dQI.jXp' );
define( 'NONCE_KEY',         '>l}9&h?)80k:Zp~G!k/S#azHR9rLT]W*C-r4z=Qo>KBCy_TE{#R&4]0%@z^)YzfP' );
define( 'AUTH_SALT',         '88JlvHo_NgQ<.>7HoXmR[C1BkQ*2?F&kzsNa1dWpGUPuhUl(`vlj2S#lDUkogz`+' );
define( 'SECURE_AUTH_SALT',  '_Q$>RJlS@idGoCjmTpGz6Dq/>qtx889bA42H%XfExj^.9dWW}ads:ebUUxsV%Q|9' );
define( 'LOGGED_IN_SALT',    '$%Ldq5Gs5c @;Tn0CkT_F$&s?udP};9dWn^~&_Kfgpt8afEowk>z@}D:4L=.5pX>' );
define( 'NONCE_SALT',        '#[*yOUmv?mOZ,ss 6e#jj; 2:6%a4J`bbi<~sS1-=$C(_3e?)LxSN>7^_bToEL C' );
define( 'WP_CACHE_KEY_SALT', '8::.^FcQi/VSyhK5lEQKC.WEd5L=E(|dQ]Fj6D(BaIc&%Y~nq^.@v9GZ.Z/1eF[7' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

define( 'WP_ENVIRONMENT_TYPE', 'local' );
/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
