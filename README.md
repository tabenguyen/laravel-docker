### Laravel docker (PHP 7.4 and 8.1)

Included setting:
(Only environment setting without Laravel source code)

* Webserver (NGINX + FPM)
* Cronjob included
   * `artisan queue:work`
   * `artisan schedule:run`

Modules supported
* Redis
* MYSQL

Other configuration

* Root dir: `/var/www/`
